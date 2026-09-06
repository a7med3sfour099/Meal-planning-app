import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SelectableChip extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableChip({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEADDFF) : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.transparent : const Color(0xFFCAC4D0),
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18.0,
              color: isSelected
                  ? const Color(0xFF21005D)
                  : const Color(0xFF6750A4),
            ),
            const Gap(8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
                color: isSelected
                    ? const Color(0xFF21005D)
                    : const Color(0xFF49454F),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
