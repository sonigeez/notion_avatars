import 'package:flutter/material.dart';

void main() {
  runApp(const NotionAvatarApp());
}

class NotionAvatarApp extends StatelessWidget {
  const NotionAvatarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notion Avatar Builder',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const NotionAvatarBuilder(),
    );
  }
}

class NotionAvatarBuilder extends StatefulWidget {
  const NotionAvatarBuilder({super.key});

  @override
  State<NotionAvatarBuilder> createState() => _NotionAvatarBuilderState();
}

class _NotionAvatarBuilderState extends State<NotionAvatarBuilder>
    with SingleTickerProviderStateMixin {
  final Color backGroundColor = const Color.fromRGBO(244, 244, 241, 1);

  late final TabController _tabController;

  final List<String> skintones = List.generate(
    6,
    (index) => 'assets/notion_faces/Skintone/skintone_${index + 1}.webp',
  );

  final List<String> hairs = List.generate(
    345,
    (index) => 'assets/notion_faces/Hair/hair_${index + 1}.webp',
  );

  final List<String> brows = List.generate(
    47,
    (index) => 'assets/notion_faces/Brows/brows_${index + 1}.webp',
  );

  final List<String> eyes = List.generate(
    60,
    (index) => 'assets/notion_faces/Eyes/eyes_${index + 1}.webp',
  );

  final List<String> nose = List.generate(
    68,
    (index) => 'assets/notion_faces/Nose/nose_${index + 1}.webp',
  );

  final List<String> mouth = List.generate(
    105,
    (index) => 'assets/notion_faces/Mouth/mouth_${index + 1}.webp',
  );

  final List<String> eyewear = List.generate(
    26,
    (index) => 'assets/notion_faces/Eyewear/eyewear_${index + 1}.webp',
  );

  final List<String> accessory = List.generate(
    15,
    (index) => 'assets/notion_faces/Accessory/accessory_${index + 1}.webp',
  );

  Map<String, int> get categoryCounts => {
        'Skintone': skintones.length,
        'Hair': hairs.length,
        'Brows': brows.length,
        'Eyes': eyes.length,
        'Nose': nose.length,
        'Mouth': mouth.length,
        'Eyewear': eyewear.length,
        'Accessory': accessory.length,
      };

  int _selectedSkintone = 0;
  int _selectedHair = -1;
  int _selectedBrows = -1;
  int _selectedEyes = -1;
  int _selectedNose = -1;
  int _selectedMouth = -1;
  int _selectedEyewear = -1;
  int _selectedAccessory = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onSkintoneSelected(int index) {
    setState(() => _selectedSkintone = index);
  }

  void _onHairSelected(int index) {
    setState(() => _selectedHair = index);
  }

  void _onBrowsSelected(int index) {
    setState(() => _selectedBrows = index);
  }

  void _onEyesSelected(int index) {
    setState(() => _selectedEyes = index);
  }

  void _onNoseSelected(int index) {
    setState(() => _selectedNose = index);
  }

  void _onMouthSelected(int index) {
    setState(() => _selectedMouth = index);
  }

  void _onEyewearSelected(int index) {
    setState(() => _selectedEyewear = index);
  }

  void _onAccessorySelected(int index) {
    setState(() => _selectedAccessory = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AvatarPreview(
              layers: [
                if (_selectedSkintone >= 0) skintones[_selectedSkintone],
                if (_selectedHair >= 0) hairs[_selectedHair],
                if (_selectedBrows >= 0) brows[_selectedBrows],
                if (_selectedEyes >= 0) eyes[_selectedEyes],
                if (_selectedNose >= 0) nose[_selectedNose],
                if (_selectedMouth >= 0) mouth[_selectedMouth],
                if (_selectedEyewear >= 0) eyewear[_selectedEyewear],
                if (_selectedAccessory >= 0) accessory[_selectedAccessory],
              ],
            ),
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.grey,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
              tabs: [
                Tab(text: 'Skintone (${categoryCounts['Skintone']})'),
                Tab(text: 'Hair (${categoryCounts['Hair']})'),
                Tab(text: 'Brows (${categoryCounts['Brows']})'),
                Tab(text: 'Eyes (${categoryCounts['Eyes']})'),
                Tab(text: 'Nose (${categoryCounts['Nose']})'),
                Tab(text: 'Mouth (${categoryCounts['Mouth']})'),
                Tab(text: 'Eyewear (${categoryCounts['Eyewear']})'),
                Tab(text: 'Accessory (${categoryCounts['Accessory']})'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Skintone
                  CategoryGrid(
                    items: skintones,
                    selectedIndex: _selectedSkintone,
                    onSelect: _onSkintoneSelected,
                    showNoneItem: false,
                  ),
                  CategoryGrid(
                    items: hairs,
                    selectedIndex: _selectedHair,
                    onSelect: _onHairSelected,
                    showNoneItem: true,
                  ),
                  CategoryGrid(
                    items: brows,
                    selectedIndex: _selectedBrows,
                    onSelect: _onBrowsSelected,
                    showNoneItem: true,
                  ),
                  CategoryGrid(
                    items: eyes,
                    selectedIndex: _selectedEyes,
                    onSelect: _onEyesSelected,
                    showNoneItem: true,
                  ),
                  CategoryGrid(
                    items: nose,
                    selectedIndex: _selectedNose,
                    onSelect: _onNoseSelected,
                    showNoneItem: true,
                  ),
                  CategoryGrid(
                    items: mouth,
                    selectedIndex: _selectedMouth,
                    onSelect: _onMouthSelected,
                    showNoneItem: true,
                  ),
                  CategoryGrid(
                    items: eyewear,
                    selectedIndex: _selectedEyewear,
                    onSelect: _onEyewearSelected,
                    showNoneItem: true,
                  ),
                  CategoryGrid(
                    items: accessory,
                    selectedIndex: _selectedAccessory,
                    onSelect: _onAccessorySelected,
                    showNoneItem: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarPreview extends StatelessWidget {
  final List<String> layers;

  const AvatarPreview({super.key, required this.layers});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black12, width: 0.5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: layers.map((layer) => Image.asset(layer)).toList(),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final List<String> items;
  final ValueChanged<int> onSelect;
  final int selectedIndex;
  final bool showNoneItem;

  const CategoryGrid({
    super.key,
    required this.items,
    required this.onSelect,
    required this.selectedIndex,
    this.showNoneItem = false,
  });

  @override
  Widget build(BuildContext context) {
    final count = showNoneItem ? items.length + 1 : items.length;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: count,
      itemBuilder: (context, index) {
        if (showNoneItem) {
          if (index == 0) {
            final isSelected = (selectedIndex == -1);
            return GestureDetector(
              onTap: () => onSelect(-1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: isSelected
                      ? Border.all(color: Colors.black, width: 2)
                      : Border.all(color: Colors.transparent, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(Icons.block, size: 40, color: Colors.grey),
                ),
              ),
            );
          } else {
            final actualIndex = index - 1;
            final isSelected = (selectedIndex == actualIndex);
            return GestureDetector(
              onTap: () => onSelect(actualIndex),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: isSelected
                      ? Border.all(color: Colors.black, width: 2)
                      : Border.all(color: Colors.transparent, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(items[actualIndex]),
              ),
            );
          }
        } else {
          final isSelected = (selectedIndex == index);
          return GestureDetector(
            onTap: () => onSelect(index),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: isSelected
                    ? Border.all(color: Colors.black, width: 2)
                    : Border.all(color: Colors.transparent, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(items[index]),
            ),
          );
        }
      },
    );
  }
}
