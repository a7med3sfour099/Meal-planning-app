import 'package:flutter/material.dart';

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
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      debugPrint('Splash Screen Finished!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Background.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black54,
                    BlendMode.darken,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/Sandwich.png',
                width: 247,
                height: 397,
              ),
            ),

            Positioned(
              top: 575,
              left: 0,
              right: 0,
              child: Text(
                'Plateful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 64,
                  fontFamily: 'FleurDeLeah',
                  color: Colors.yellow,
                ),
              ),
            ),

            Positioned(
              top: 655,
              left: 0,
              right: 0,
              child: Text(
                'MEAL PLANNER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),

            Positioned(
              top: 730,
              left: 0,
              right: 0,
              child: Text(
                'Your meal planning,',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),

            Positioned(
              top: 760,
              left: 0,
              right: 0,
              child: Text(
                'served on a full plate.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}