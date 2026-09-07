import 'package:flutter/material.dart';
import '../../meal/view/meal_details_view.dart';
import '../favorites_data.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,

        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Favorites',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ValueListenableBuilder<List<Map<String, String>>>(
                valueListenable: FavoritesData.favorites,

                builder: (context, favorites, child) {
                  if (favorites.isEmpty) {
                    return const Center(
                      child: Text(
                        'No favorites yet',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: favorites.length,

                    itemBuilder: (context, index) {
                      final meal = favorites[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),

                        child: _mealCard(
                          context: context,
                          image: meal['image']!,
                          name: meal['name']!,
                          type: meal['type']!,
                          mealType: meal['mealType']!,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mealCard({
    required BuildContext context,
    required String image,
    required String name,
    required String type,
    required String mealType,
  }) {
    return Container(
      height: 190,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),

                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,

                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),

                    child: IconButton(
                      onPressed: () {
                        FavoritesData.removeFavorite(mealType);
                      },

                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 40,

            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),

            decoration: const BoxDecoration(
              color: Color(0xffeeeeee),

              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MealDetailsView(
                            mealType: mealType,
                          );
                        },
                      ),
                    );
                  },

                  child: const Text(
                    'More',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}