import 'package:flutter/material.dart';
import 'favorites/favorites_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void toggleFavorite({
    required String image,
    required String name,
    required String type,
    required String mealType,
  }) {
    setState(() {
      FavoritesData.toggleFavorite(
        image: image,
        name: name,
        type: type,
        mealType: mealType,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: const Text(
          'Welcome, Shahd',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Fleur De Leah',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 235, 233, 233),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 98, 95, 95),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Today`s Meal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Picked for you today',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/meal_to_prepare');
                },
                child: Center(
                  child: mealImage(
                    width: 390,
                    height: 261,
                    image: 'assets/images/Dish_1.png',
                    mealType: 'arrabbiata',
                    name: 'Spicy Arrabbiata Penne',
                    type: 'Pasta, Curry',
                    top: 200,
                    right: 30,
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Text(
                  'Spicy Arrabiata Penne',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Italian',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
                ),
              ),

              const SizedBox(height: 5),

              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Text(
                  'Greek',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Suggested cuisine',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),

              const SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 16),

                    suggestedCuisine(
                      image: 'assets/images/Dish_1.png',
                      name: 'Spicy Arrabiata Penne',
                      type: 'Pasta, Curry',
                      mealType: 'arrabbiata',
                    ),

                    const SizedBox(width: 17),

                    suggestedCuisine(
                      image: 'assets/images/burger.jpg',
                      name: 'Classic Burger',
                      type: 'Burger, Beef',
                      mealType: 'burger',
                    ),

                    const SizedBox(width: 17),

                    suggestedCuisine(
                      image: 'assets/images/chicken.jpg',
                      name: 'Chicken Meal',
                      type: 'Chicken',
                      mealType: 'chicken',
                    ),

                    const SizedBox(width: 17),

                    suggestedCuisine(
                      image: 'assets/images/Sandwich.png',
                      name: 'Sandwich',
                      type: 'Sandwich',
                      mealType: 'sandwich',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Text(
                  'Daily Selection',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Random meals to explore',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                ),
              ),

              const SizedBox(height: 10),

              dailySelection(
                image: 'assets/images/Dish_2.png',
                name: 'Daily Dish',
                type: 'Meal',
                mealType: 'daily_dish',
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Text(
                  'Meal to Prepare',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Today from your calendar',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: mealImage(
                  width: 390,
                  height: 261,
                  image: 'assets/images/Dish_1.png',
                  mealType: 'arrabbiata',
                  name: 'Spicy Arrabbiata Penne',
                  type: 'Pasta, Curry',
                  top: 200,
                  right: 30,
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 5),
                child: Text(
                  'Spicy Arrabiata Penne',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '8 Ingredients',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // =========================
  // Big Meal Image
  // =========================

  Widget mealImage({
    required double width,
    required double height,
    required String image,
    required String mealType,
    required String name,
    required String type,
    required double top,
    required double right,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(image, fit: BoxFit.fill)),

            // Vegetarian
            Positioned(
              top: top,
              right: right,
              child: Container(
                width: 86,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(
                  child: Text(
                    'Vegetarian',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),

            // Favorite
            Positioned(
              top: 10,
              right: 10,
              child: favoriteButton(
                image: image,
                name: name,
                type: type,
                mealType: mealType,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================
  // Favorite Button
  // =========================

  Widget favoriteButton({
    required String image,
    required String name,
    required String type,
    required String mealType,
  }) {
    final bool isFavorite = FavoritesData.isFavorite(mealType);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          toggleFavorite(
            image: image,
            name: name,
            type: type,
            mealType: mealType,
          );
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.grey,
          size: 22,
        ),
      ),
    );
  }

  // =========================
  // Suggested Cuisine
  // =========================

  Widget suggestedCuisine({
    required String image,
    required String name,
    required String type,
    required String mealType,
  }) {
    return SizedBox(
      width: 176,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 176,
            height: 176,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: favoriteButton(
                      image: image,
                      name: name,
                      type: type,
                      mealType: mealType,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),

          Text(
            type,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }

  // =========================
  // Daily Selection
  // =========================

  Widget dailySelection({
    required String image,
    required String name,
    required String type,
    required String mealType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),

              // Favorite
              Positioned(
                top: 10,
                right: 10,
                child: favoriteButton(
                  image: image,
                  name: name,
                  type: type,
                  mealType: mealType,
                ),
              ),

              // Meal information
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.black45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        type,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
