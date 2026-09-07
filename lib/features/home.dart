import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,

        title: Text(
          'Welcome, User',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Fleur De Leah',
          ),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 233, 233),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, color: Color.fromARGB(255, 98, 95, 95)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Today`s Meal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Picked for you today',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
              ),

              SizedBox(height: 10),
              Center(
                child: spicyArribiataPenne(390, 261, 200, 30, fit: BoxFit.fill),
              ),

              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Text(
                  'Spicy Arrabiata Penne',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Italian',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
                ),
              ),

              SizedBox(height: 5),

              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Text(
                  'Greek',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Suggested cuisine',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),

              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 16),

                    suggestedCuisine(),

                    SizedBox(width: 17),

                    suggestedCuisine(),

                    SizedBox(width: 17),

                    suggestedCuisine(),

                    SizedBox(width: 17),

                    suggestedCuisine(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Text(
                  'Daily Selection',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Random meals to explore',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 370,
                  height: 405,
                  child: Stack(
                    children: [
                      dailySelection(0, 'Assets/Images/Dish_2.png'),
                      dailySelection(9, 'Assets/Images/Dish_1.png'),
                      dailySelection(18, 'Assets/Images/Dish_2.png'),
                      Positioned(
                        left: 2,
                        bottom: 12,
                        width: 366,
                        height: 45,
                        child: Container(
                            width: 86,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: Colors.black45,
                                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(18) ),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Spicy Arrabiata Penne',
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                          ),
                                          Text('italian',
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
                                            color: Colors.white),)
                                        ],
                                      ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Text(
                  'Meal to Prepare',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Today from your calendar',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                ),
              ),
              spicyArribiataPenne(390, 261, 200, 30, fit: BoxFit.fill)
              ,Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 5),
                child: Text(
                  'Spicy Arrabiata Penne',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '8 Ingredients',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                ),
              ),
            ],
          
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white10,

          boxShadow: [
            BoxShadow(
              color: Color(0x15000000),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(icon: Icons.home, label: 'Home', selected: true),

            _navItem(icon: Icons.search, label: 'Search'),

            _navItem(icon: Icons.public, label: 'Explore'),

            _navItem(icon: Icons.bookmark, label: 'Favorites'),

            _navItem(icon: Icons.calendar_month, label: 'Calendar'),
          ],
        ),
      ),
    );
  }
}

Widget spicyArribiataPenne(
  double width,
  double height,
  double top,
  double right, {
  BoxFit fit = BoxFit.cover,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('Assets/Images/Dish_1.png', fit: fit),
          ),

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
              child: Center(
                child: Text(
                  'Vegetarian',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget suggestedCuisine() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      spicyArribiataPenne(176, 176, 125, 5),

      SizedBox(height: 5),

      Text(
        'Spicy Arrabiata Penne',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),

      Text(
        'Pasta, Curry',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
      ),
    ],
  );
}

Widget _navItem({
  required IconData icon,
  required String label,
  bool selected = false,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        icon,
        size: 27,
        color: selected ? Color(0xFF5F6368) : Color(0xFF808388),
      ),

      SizedBox(height: 3),

      Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          color: selected ? Color(0xFF5F6368) : Color(0xFF808388),
        ),
      ),
    ],
  );
}

Widget dailySelection(double left, String imagePath) {
  return Positioned(
    left: left,
    top: 0,
    height: 405,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(imagePath, width: 350, height: 180, fit: BoxFit.cover),
    ),
    
    
  );
}
