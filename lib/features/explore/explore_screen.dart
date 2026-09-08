import 'package:flutter/material.dart';
import 'explore_details_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final searchController = TextEditingController();

  bool isCategoriesSelected = true;

  String? selectedCategory;

  final List<String> categories = [
    'Breakfast',
    'Starter',
    'Dessert',
    'Lunch',
    'Side',
    'Vegan',
    'Vegetarian',
    'Pasta',
    'Seafood',
    'Miscellaneous',
  ];

  final List<String> cuisines = [
    'Italian',
    'Indian',
    'Chinese',
    'Mexican',
  ];

  @override
  Widget build(BuildContext context) {
    if (selectedCategory != null) {
      return ExploreDetailsScreen(
        categoryName: selectedCategory!,
        onBack: () {
          setState(() {
            selectedCategory = null;
          });
        },
      );
    }

    List<String> currentList = isCategoriesSelected ? categories : cuisines;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCategoriesSelected = true;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isCategoriesSelected ? Colors.indigo : Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        if (isCategoriesSelected)
                          Container(height: 2, width: 90, color: Colors.indigo),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCategoriesSelected = false;
                      });
                    },
                    child: Text(
                      'Cuisines',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: !isCategoriesSelected ? Colors.indigo : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),

              SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: currentList.length,
                  itemBuilder: (context, index) {
                    String name = currentList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo.shade100,
                        child: Text(
                          name[0],
                          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(name, style: TextStyle(fontSize: 16)),
                      onTap: () {
                        setState(() {
                          selectedCategory = name;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
