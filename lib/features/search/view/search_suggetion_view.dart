import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchSuggestionsView extends StatelessWidget {
  final ValueChanged<String> onSuggestionTap;

  const SearchSuggestionsView({super.key, required this.onSuggestionTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSimpleTextSuggestion('Spicy Arrabiata Penne'),
        _buildSimpleTextSuggestion('Spicy Penne'),
        _buildSimpleTextSuggestion('Spicy'),
        const Divider(height: 1, color: Color(0xFFDCDDDF)),
        const Gap(8.0),
        _buildRichSuggestion('Greek', 'Cuisine'),
        _buildRichSuggestion('Chicken', 'Ingredient'),
        _buildRichSuggestion('Vegetarian', 'Category'),
        const Gap(16.0),
      ],
    );
  }

  Widget _buildSimpleTextSuggestion(String text) {
    return InkWell(
      onTap: () => onSuggestionTap(text),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFF232323),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildRichSuggestion(String title, String subtitle) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 1.0,
      ),
      leading: const CircleAvatar(
        radius: 20.0,
        backgroundColor: Color(0xFFA8C7FA),
        child: Text(
          'A',
          style: TextStyle(
            color: Color(0xFF062E6F),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16.0,
          color: Color(0xFF232323),
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 13.0, color: Color(0xFF5F6368)),
      ),
      onTap: () => onSuggestionTap(title),
    );
  }
}
