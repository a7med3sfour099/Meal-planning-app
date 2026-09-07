import 'package:flutter/material.dart';
import 'package:mealplan/features/search/view/search_view.dart';
import 'package:mealplan/meal_to_prepare.dart';
import 'package:mealplan/splash.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';


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
      // home: Splash(),
      home: Search(),

      routes: <String, WidgetBuilder>{
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
