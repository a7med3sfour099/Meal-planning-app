import 'package:flutter/material.dart';
import '../favorites_data.dart';

class FavoriteButton extends StatelessWidget {
  final String image;
  final String name;
  final String type;
  final String mealType;

  const FavoriteButton({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.mealType,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFavorite =
    FavoritesData.isFavorite(mealType);

    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          FavoritesData.toggleFavorite(
            image: image,
            name: name,
            type: type,
            mealType: mealType,
          );
        },
        icon: Icon(
          isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
          color: isFavorite
              ? Colors.red
              : Colors.grey,
          size: 22,
        ),
      ),
    );
  }
}