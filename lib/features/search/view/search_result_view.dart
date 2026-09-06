import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Search Results',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        const Gap(16.0),

        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 80,
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
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
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
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        const Gap(16.0),

        Row(
          children: [
            Expanded(
              child: _buildSmallMealCard(
                'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
              ),
            ),
            const Gap(16.0),
            Expanded(
              child: _buildSmallMealCard(
                'https://images.unsplash.com/photo-1598514982205-f36b96d1e8d4?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallMealCard(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.network(
        imageUrl,
        height: 140,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
