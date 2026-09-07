import 'package:flutter/material.dart';
import '../../favorites/favorites_data.dart';

class MealDetailsView extends StatefulWidget {
  final String mealType;

  const MealDetailsView({
    super.key,
    required this.mealType,
  });

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  late String mealName;
  late String imagePath;
  late String cuisine;
  late String category;
  late List<Map<String, String>> ingredients;

  @override
  void initState() {
    super.initState();

    if (widget.mealType == 'burger') {
      mealName = 'Classic Burger';
      imagePath = 'assets/images/burger.jpg';
      cuisine = 'American';
      category = 'Burger, Beef';

      ingredients = [
        {
          'name': 'burger bun',
          'quantity': '1 piece',
        },
        {
          'name': 'beef patty',
          'quantity': '1 piece',
        },
        {
          'name': 'cheddar cheese',
          'quantity': '1 slice',
        },
        {
          'name': 'lettuce',
          'quantity': '2 leaves',
        },
        {
          'name': 'tomato',
          'quantity': '2 slices',
        },
      ];
    } else {
      mealName = 'Spicy Arrabbiata Penne';
      imagePath = 'assets/images/arrabbiata.jpg';
      cuisine = 'Italian';
      category = 'Pasta, Curry';

      ingredients = [
        {
          'name': 'penne rigate',
          'quantity': '1 pound',
        },
        {
          'name': 'olive oil',
          'quantity': '1/4 cup',
        },
        {
          'name': 'garlic',
          'quantity': '3 cloves',
        },
        {
          'name': 'chopped tomatoes',
          'quantity': '1 tin',
        },
        {
          'name': 'red chilli flakes',
          'quantity': '1/2 teaspoon',
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),

        title: const Text(
          'Meal Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        centerTitle: true,

        // =========================
        // Favorite Button
        // =========================
        actions: [
          ValueListenableBuilder<List<Map<String, String>>>(
            valueListenable: FavoritesData.favorites,
            builder: (context, favorites, child) {
              final bool isFavorite =
              FavoritesData.isFavorite(widget.mealType);

              return IconButton(
                onPressed: () {
                  FavoritesData.toggleFavorite(
                    image: imagePath,
                    name: mealName,
                    type: category,
                    mealType: widget.mealType,
                  );
                },
                icon: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: isFavorite
                      ? Colors.red
                      : Colors.black,
                ),
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                mealName,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'From your favorites',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 15),

              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),

                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: 261,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    right: 10,

                    child: Row(
                      children: [
                        _infoChip(
                          icon: Icons.public,
                          text: cuisine,
                        ),

                        const SizedBox(width: 8),

                        _infoChip(
                          icon: Icons.restaurant,
                          text: category,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Column(
                children: [
                  for (int i = 0; i < ingredients.length; i++) ...[
                    IngredientItem(
                      name: ingredients[i]['name']!,
                      quantity: ingredients[i]['quantity']!,
                    ),

                    if (i != ingredients.length - 1)
                      const SizedBox(height: 25),
                  ],
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'Instructions',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              _buildInstructions(),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoChip({
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            icon,
            size: 15,
            color: Colors.black,
          ),

          const SizedBox(width: 5),

          Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions() {
    if (widget.mealType == 'burger') {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Prepare the burger patty and season it with salt and pepper.',
            style: TextStyle(
              fontSize: 15,
              height: 1.4,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 30),

          Text(
            'Heat a pan over medium-high heat and cook the beef patty until fully cooked.',
            style: TextStyle(
              fontSize: 15,
              height: 1.4,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 30),

          Text(
            'Toast the burger bun, then add the patty, cheese, lettuce and tomato.',
            style: TextStyle(
              fontSize: 15,
              height: 1.4,
              color: Colors.black,
            ),
          ),
        ],
      );
    }

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'Boil the penne in salted water until al dente.',
          style: TextStyle(
            fontSize: 15,
            height: 1.4,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 30),

        Text(
          'Heat olive oil in a pan and sauté the garlic with red chilli flakes.',
          style: TextStyle(
            fontSize: 15,
            height: 1.4,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 30),

        Text(
          'Add the chopped tomatoes and cook until the sauce becomes rich and thick.',
          style: TextStyle(
            fontSize: 15,
            height: 1.4,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 30),

        Text(
          'Add the cooked penne to the sauce and mix well before serving.',
          style: TextStyle(
            fontSize: 15,
            height: 1.4,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class IngredientItem extends StatefulWidget {
  final String name;
  final String quantity;

  const IngredientItem({
    super.key,
    required this.name,
    required this.quantity,
  });

  @override
  State<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: checked,

          onChanged: (value) {
            setState(() {
              checked = value ?? false;
            });
          },
        ),

        const SizedBox(width: 5),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              widget.quantity,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}