import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mealplan/features/search/widget/selectable_chip.dart';

class SearchHomeView extends StatelessWidget {
  final String selectedChip;
  final ValueChanged<String> onChipSelected;

  const SearchHomeView({
    super.key,
    required this.selectedChip,
    required this.onChipSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Searches',
          style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600),
        ),
        const Gap(8.0),
        Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          children: [
            SelectableChip(
              title: "Greek",
              icon: Icons.search,
              isSelected: selectedChip == "Greek",
              onTap: () => onChipSelected("Greek"),
            ),
            SelectableChip(
              title: "Italian",
              icon: Icons.search,
              isSelected: selectedChip == "Italian",
              onTap: () => onChipSelected("Italian"),
            ),
            SelectableChip(
              title: "Chicken",
              icon: Icons.search,
              isSelected: selectedChip == "Chicken",
              onTap: () => onChipSelected("Chicken"),
            ),
          ],
        ),
        const Gap(32.0),
        const Text(
          'Popular Searches',
          style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600),
        ),
        const Gap(8.0),
        Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          children: [
            SelectableChip(
              title: "Greek",
              icon: Icons.trending_up,
              isSelected: selectedChip == "Greek_2",
              onTap: () => onChipSelected("Greek_2"),
            ),
            SelectableChip(
              title: "Chicken",
              icon: Icons.trending_up,
              isSelected: selectedChip == "Chicken_2",
              onTap: () => onChipSelected("Chicken_2"),
            ),
            SelectableChip(
              title: "Beef",
              icon: Icons.trending_up,
              isSelected: selectedChip == "Beef",
              onTap: () => onChipSelected("Beef"),
            ),
          ],
        ),
      ],
    );
  }
}