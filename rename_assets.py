import os
from pathlib import Path
import re

def natural_sort_key(s):
    """
    Sort strings containing numbers in natural order.
    This ensures that "2" comes before "10" in sorting.
    """
    return [int(text) if text.isdigit() else text.lower()
            for text in re.split('([0-9]+)', str(s))]

def rename_files_in_directory(directory):
    """
    Rename all .webp files in the given directory to follow the pattern:
    category_number.webp where category is the folder name
    """
    directory_path = Path(directory)
    category = directory_path.name.lower()
    
    # Get all .webp files and sort them naturally
    webp_files = [f for f in directory_path.glob('*.webp')]
    webp_files.sort(key=natural_sort_key)
    
    print(f"\nProcessing {category} directory ({len(webp_files)} files):")
    
    # Create a mapping of old names to new names
    rename_mapping = {}
    for index, file_path in enumerate(webp_files, start=1):
        new_name = f"{category}_{index}.webp"
        rename_mapping[file_path] = directory_path / new_name
    
    # Perform the renaming
    for old_path, new_path in rename_mapping.items():
        try:
            if old_path.name != new_path.name:  # Only rename if names are different
                print(f"  Renaming: {old_path.name} -> {new_path.name}")
                old_path.rename(new_path)
        except Exception as e:
            print(f"  Error renaming {old_path.name}: {str(e)}")

def main():
    base_path = Path(__file__).parent / 'assets' / 'notion_faces'
    
    # Process each subdirectory
    categories = [d for d in base_path.iterdir() if d.is_dir()]
    
    print(f"Found {len(categories)} categories to process")
    
    for category_dir in categories:
        rename_files_in_directory(category_dir)
    
    print("\nRenaming complete!")

if __name__ == "__main__":
    main()
