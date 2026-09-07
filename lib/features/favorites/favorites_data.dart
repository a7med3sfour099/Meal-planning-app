import 'package:flutter/material.dart';

class FavoritesData {
  static final ValueNotifier<List<Map<String, String>>> favorites =
  ValueNotifier([]);

  static void toggleFavorite({
    required String image,
    required String name,
    required String type,
    required String mealType,
  }) {
    final currentFavorites = List<Map<String, String>>.from(
      favorites.value,
    );

    final index = currentFavorites.indexWhere(
          (meal) => meal['mealType'] == mealType,
    );

    if (index != -1) {
      currentFavorites.removeAt(index);
    } else {
      currentFavorites.add({
        'image': image,
        'name': name,
        'type': type,
        'mealType': mealType,
      });
    }

    favorites.value = currentFavorites;
  }

  static bool isFavorite(String mealType) {
    return favorites.value.any(
          (meal) => meal['mealType'] == mealType,
    );
  }

  static void removeFavorite(String mealType) {
    final currentFavorites = List<Map<String, String>>.from(
      favorites.value,
    );

    currentFavorites.removeWhere(
          (meal) => meal['mealType'] == mealType,
    );

    favorites.value = currentFavorites;
  }
}