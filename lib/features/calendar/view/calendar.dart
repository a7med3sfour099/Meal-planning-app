import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../meal/view/meal_details_view.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String placeholderImage =
        'assets/images/calendar_image.png';

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upcoming Meals',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const Gap(24.0),

              _buildDateHeader('Feb 18', 'Wednesday'),
              const Gap(16.0),
              _buildMealItem(
                context,
                'Starter',
                'Spicy Arrabiata Penne',
                '12 Ingredients',
                placeholderImage,
                'arrabbiata',
              ),
              const Gap(24.0),

              // Feb 19 Section
              _buildDateHeader('Feb 19', 'Thursday'),
              const Gap(16.0),
              _buildMealItem(
                context,
                'Starter',
                'Spicy Arrabiata Penne',
                '12 Ingredients',
                placeholderImage,
                'arrabbiata',
              ),
              const Gap(12.0),
              _buildMealItem(
                context,
                'Starter',
                'Spicy Arrabiata Penne',
                '12 Ingredients',
                placeholderImage,
                'arrabbiata',
              ),
              const Gap(24.0),

              // Feb 20 Section
              _buildDateHeader('Feb 20', 'Friday'),
              const Gap(16.0),
              _buildMealItem(
                context,
                'Starter',
                'Spicy Arrabiata Penne',
                '12 Ingredients',
                placeholderImage,
                'arrabbiata',
              ),
              const Gap(24.0),

              // Feb 21 Section
              _buildDateHeader('Feb 21', 'Saturday'),
              const Gap(16.0),
              _buildMealItem(
                context,
                'Starter',
                'Spicy Arrabiata Penne',
                '12 Ingredients',
                placeholderImage,
                'arrabbiata',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the "Date Day -----" divider row
  Widget _buildDateHeader(String date, String day) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          date,
          style: const TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const Gap(6.0),
        Text(
          day,
          style: const TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w300,
            color: Color(0xFF4A4A4A),
          ),
        ),
        const Gap(12.0),
        const Expanded(
          child: Divider(color: Color(0xFFE0E0E0), thickness: 1.0),
        ),
      ],
    );
  }

  /// Builds the individual meal row with the image and text details
  Widget _buildMealItem(
      BuildContext context,
      String category,
      String name,
      String ingredients,
      String imagePath,
      String mealType,
  ) {
    return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealDetailsView(
            mealType: mealType,
          ),
        ),
      );
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image Container with soft pinkish shadow/background
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: const Color(
              0xFFF5E4E6,
            ), // Soft pink background matching the design
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: ClipOval(
              child: Image.asset(
                imagePath,
                height: 75,
                width: 75,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Gap(16.0),

        // Text Details Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,

                  color: Color(0xFF232323),
                ),
              ),
              const Gap(2.0),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000),
                ),
              ),
              const Gap(2.0),
              Text(
                ingredients,
                style: const TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF232323),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
