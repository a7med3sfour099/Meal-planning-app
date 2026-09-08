import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    const String placeholderImage = 'assets/images/Dish_1.png';
    const String placeholderImage_2 = 'assets/images/Dish_2.png';
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Search Results',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          const Gap(16.0),

          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  'assets/images/result_3.png',
                  height: 345,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Spicy Arrabiata Penne',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Italian',
                        style: TextStyle(color: Colors.white70, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Gap(24.0),
          const Text(
            'Suggested Meals',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          const Gap(16.0),

          Row(
            children: [
              Expanded(child: _buildSmallMealCard(placeholderImage)),
              const Gap(16.0),
              Expanded(child: _buildSmallMealCard(placeholderImage)),
            ],
          ),
          const Gap(16.0),
          Row(
            children: [
              Expanded(child: _buildSmallMealCard(placeholderImage_2)),
              const Gap(16.0),
              Expanded(child: _buildSmallMealCard(placeholderImage_2)),
            ],
          ),
          // Gap(160.0),
        ],
      ),
    );
  }

  Widget _buildSmallMealCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.asset(
        imagePath,
        height: 140,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 140,
            color: Colors.grey[200],
            child: const Icon(Icons.food_bank, size: 40, color: Colors.grey),
          );
        },
      ),
    );
  }
}
