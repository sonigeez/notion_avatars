import os
from collections import defaultdict

def count_items_in_folders(root_path):
    folder_counts = defaultdict(int)
    
    for root, dirs, files in os.walk(root_path):
        # Get the relative path from the root
        rel_path = os.path.relpath(root, root_path)
        if rel_path == '.':
            rel_path = 'root'
            
        # Count all items (both files and directories)
        folder_counts[rel_path] = len(dirs) + len(files)
        
    return folder_counts

def main():
    assets_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'assets')
    counts = count_items_in_folders(assets_path)
    
    print("\nFolder Item Counts:")
    print("-" * 50)
    for folder, count in sorted(counts.items()):
        print(f"{folder}: {count} items")

if __name__ == "__main__":
    main()
