import 'package:flutter/material.dart';
import 'package:mealplan/features/calendar/view/calendar.dart';
import 'package:mealplan/features/search/view/search_view.dart';
import 'package:mealplan/meal_to_prepare.dart';
import 'package:mealplan/splash.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';
import 'package:mealplan/auth_screen.dart';
import 'package:mealplan/features/favorites/view/favorites_view.dart';
import 'main_navigation.dart';
import 'package:mealplan/features/explore/explore_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/signin': (context) => const SignInScreen(),
        '/home': (context) => const MainNavigation(),
        '/favorites': (context) => const FavoritesView(),
        '/meal_to_prepare': (context) => const MealToPrepareScreen(),
      },
      // home: SearchScreen(),
      // home: MealToPrepareScreen(),
    );
  }
}