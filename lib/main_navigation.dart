import 'package:flutter/material.dart';
import 'package:mealplan/features/calendar/view/calendar.dart';

import 'package:mealplan/features/favorites/view/favorites_view.dart';
import 'package:mealplan/features/search/view/search_view.dart';

import 'package:mealplan/features/home.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const Home(),
    SearchScreen(),

    const Center(
      child: Text(
        'Explore',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),

    const FavoritesView(),
    const CalendarScreen(),

    // const Center(
    //   child: Text(
    //     'Calendar',
    //     style: TextStyle(
    //       fontSize: 24,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        selectedItemColor: const Color(0xFF555A61),
        unselectedItemColor: const Color(0xFF8A8E93),

        selectedFontSize: 10,
        unselectedFontSize: 10,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),

          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Explore'),

          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: 'Favorites',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
        ],
      ),
    );
  }
}
