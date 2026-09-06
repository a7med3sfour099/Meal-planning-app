import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widget/selectable_chip.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _select = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search for Meal',
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600),
              ),
              Gap(8.0),
              Text(
                'Find meals by name, country, ingredient or category.',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color(0xFF232323),
                  fontWeight: FontWeight.w300,
                ),
              ),
              Gap(32.0),
              TextField(
                style: TextStyle(
                  color: Color(0xFF44464F),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  fillColor: Color(0xFFEEEFF3),
                  filled: true,
                  suffixIcon: Icon(Icons.search, color: Color(0xFF44464F)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: Color(0xFF44464F),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Gap(32.0),
              Text(
                'Recent Searches',
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600),
              ),
              Gap(8.0),
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: [
                  SelectableChip(
                    title: "Greek",
                    icon: Icons.search,
                    isSelected: _select == "Greek",
                    onTap: () => setState(() => _select = "Greek"),
                  ),
                  SelectableChip(
                    title: "Italian",
                    icon: Icons.search,
                    isSelected: _select == "Italian",
                    onTap: () => setState(() => _select = "Italian"),
                  ),
                  SelectableChip(
                    title: "Chicken",
                    icon: Icons.search,
                    isSelected: _select == "Chicken",
                    onTap: () => setState(() => _select = "Chicken"),
                  ),
                ],
              ),
              Gap(32.0),
              Text(
                'Popular Searches',
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600),
              ),
              Gap(8.0),
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: [
                  SelectableChip(
                    title: "Greek",
                    icon: Icons.trending_up,
                    isSelected: _select == "Greek_2",
                    onTap: () => setState(() => _select = "Greek_2"),
                  ),
                  SelectableChip(
                    title: "Chicken",
                    icon: Icons.trending_up,
                    isSelected: _select == "Chicken_2",
                    onTap: () => setState(() => _select = "Chicken_2"),
                  ),
                  SelectableChip(
                    title: "Beef",
                    icon: Icons.trending_up,
                    isSelected: _select == "Beef",
                    onTap: () => setState(() => _select = "Beef"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
