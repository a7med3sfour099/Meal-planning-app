import 'package:flutter/material.dart';
import '../meal/view/meal_details_view.dart';

class ExploreDetailsScreen extends StatelessWidget {
  final String categoryName;
  final VoidCallback onBack;

  const ExploreDetailsScreen({
    super.key,
    required this.categoryName,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> meals = [
      {
        'name': 'Spicy Arrabiata Penne',
        'image': 'assets/images/result_1.png',
        'sub': 'More',
      },
      {
        'name': 'Roasted Garlic Potatoes',
        'image': 'assets/images/result_2.png',
        'sub': 'More',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: onBack,
        ),
        title: Column(
          children: [
            Text(
              categoryName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              'Category',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          Map<String, String> meal = meals[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            width: double.infinity,
            height: 220,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(meal['image']!, fit: BoxFit.cover),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            meal['name']!,
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          meal['sub'] == 'More'
                              ? ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MealDetailsView(
                                    mealType: index == 0 ? 'arrabbiata' : 'garlic',
                                  ),
                                ),
                              );
                            },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Text('More', style: TextStyle(color: Colors.white)),
                                )
                              : Text(
                                  meal['sub']!,
                                  style: TextStyle(color: Colors.white, fontSize: 13),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
