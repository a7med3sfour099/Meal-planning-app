import 'package:flutter/material.dart';
import 'features/home.dart';
import 'features/explore/explore_screen.dart';
import 'features/search/view/search_view.dart';
import 'features/favorites/view/favorites_view.dart';
import 'features/calendar/view/calendar.dart';

class MainNavigation extends StatefulWidget {
  final String userName;

  const MainNavigation({
    super.key,
    this.userName = 'Guest',
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const Home(),
    const SearchScreen(),
    const ExploreScreen(),
    const FavoritesView(),
    const CalendarScreen(),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Explore',
          ),
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
