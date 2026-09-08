import 'package:flutter/material.dart';

class MealToPrepareScreen extends StatelessWidget {
  const MealToPrepareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(fontSize: 16),
        ),
        fontFamily: "Noto Sans",
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "Meal to Prepare",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton<String>(
              offset: const Offset(-15, 45),
              color: Colors.white,
              icon: const Icon(Icons.more_vert, color: Colors.black),
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'remove',
                  child: Row(
                    children: [
                      Icon(Icons.remove, size: 20),
                      SizedBox(width: 12),
                      Text('Remove from Calendar'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'favorite',
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.red, size: 20),
                      SizedBox(width: 12),
                      Text('Add to Favorites'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'share',
                  child: Row(
                    children: [
                      Icon(Icons.share_outlined, size: 20),
                      SizedBox(width: 12),
                      Text('Share'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spicy Arrabiata Penne",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Noto Sans",
                    ),
                  ),
                  Text(
                    "From your calendar",
                    style: TextStyle(fontWeight: FontWeight(300), fontSize: 16),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image.asset(
                          "assets/images/d56d0ac12a1226ce3d0616411996ee38afc0790a.jpg",
                          width: 345,
                          height: 261,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 8,
                        child: Row(
                          children: [
                            // Chip(
                            //   avatar: Icon(
                            //     Icons.public,
                            //     color: Colors.black,
                            //     size: 15,
                            //   ),
                            //   label: Text(
                            //     'Japanese',
                            //     style: TextStyle(
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            //   backgroundColor: Colors.transparent,

                            //   side: BorderSide.none,
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(16),
                            //   ),
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.29),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.public,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Japanese',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            // Chip(
                            //   avatar: Icon(Icons.restaurant, size: 15),
                            //   label: Text(
                            //     'chicken',
                            //     style: TextStyle(fontSize: 10),
                            //   ),
                            //   backgroundColor: Colors.white.withValues(
                            //     alpha: 0,
                            //   ),
                            //   side: BorderSide.none,
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(16),
                            //   ),
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.29),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.restaurant,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Chicken',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Column(
                    children: [
                      IngredientItem(name: 'penne rigate', quantity: '1 pound'),
                      SizedBox(height: 35),
                      IngredientItem(name: 'olive oil', quantity: '1/4 cup'),
                      SizedBox(height: 35),
                      IngredientItem(name: 'garlic', quantity: '3 cloves'),
                      SizedBox(height: 35),
                      IngredientItem(
                        name: 'chopped tomatoes',
                        quantity: '1 tin',
                      ),
                      SizedBox(height: 35),
                      IngredientItem(
                        name: 'red chilli flakes',
                        quantity: '1/2 teaspoon',
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Recipe Video',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Video
                  _buildRecipeVideo(),

                  const SizedBox(height: 25),

                  // Instructions title
                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Instructions
                  _buildInstructions(),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }
}

class IngredientItem extends StatelessWidget {
  final String name;
  final String quantity;

  const IngredientItem({super.key, required this.name, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(name), Text(quantity)],
        ),
      ],
    );
  }
}

Widget _buildRecipeVideo() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Stack(
      alignment: Alignment.center,
      children: [
        // Food image
        Image.asset(
          'assets/images/d56d0ac12a1226ce3d0616411996ee38afc0790a.jpg',
          width: 345,
          height: 209,
          fit: BoxFit.cover,
        ),

        // Dark/light play button background
        SizedBox(
          width: 24,
          height: 32,
          child: const Icon(Icons.play_arrow, size: 50, color: Colors.white),
        ),
      ],
    ),
  );
}

Widget _buildInstructions() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Preheat oven to 350° F. Spray a 9x13-inch '
        'baking pan with non-stick spray.',
        style: TextStyle(fontSize: 15, height: 1.4, color: Colors.black),
      ),

      SizedBox(height: 42),

      Text(
        'Combine soy sauce, ½ cup water, brown '
        'sugar, ginger and garlic in a small saucepan '
        'and cover. Bring to a boil over medium heat. '
        'Remove lid and cook for one minute once '
        'boiling.',
        style: TextStyle(fontSize: 15, height: 1.4, color: Colors.black),
      ),

      SizedBox(height: 42),

      Text(
        'Meanwhile, stir together the corn starch and '
        '2 tablespoons of water in a separate dish until '
        'smooth. Once sauce is boiling, add mixture to '
        'the saucepan and stir to combine. Cook until '
        'the sauce starts to thicken then remove from '
        'heat.',
        style: TextStyle(fontSize: 15, height: 1.4, color: Colors.black),
      ),
    ],
  );
}

Widget _buildBottomNavigation() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,

    backgroundColor: Colors.white,

    selectedItemColor: const Color(0xFF555A61),
    unselectedItemColor: const Color(0xFF8A8E93),

    selectedFontSize: 16,
    unselectedFontSize: 16,

    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Explore'),
      BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Favorites'),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month),
        label: 'Calendar',
      ),
    ],
  );
}
