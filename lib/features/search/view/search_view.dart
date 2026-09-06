import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mealplan/features/search/view/search_home_view.dart';
import 'package:mealplan/features/search/view/search_result_view.dart';
import 'package:mealplan/features/search/view/search_suggetion_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _select = "";
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  bool _showResults = false;

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {
      setState(() {
        if (_searchFocusNode.hasFocus) {
          _showResults = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    _searchController.text = query;
    _searchFocusNode.unfocus();
    setState(() {
      _showResults = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isSearching = _searchFocusNode.hasFocus;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search for Meal',
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600),
              ),
              const Gap(8.0),
              const Text(
                'Find meals by name, country, ingredient or category.',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color(0xFF232323),
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Gap(24.0),

              // Search Bar Container
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEFF3),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      onSubmitted: _performSearch,
                      style: const TextStyle(
                        color: Color(0xFF44464F),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefixIcon: (isSearching || _showResults)
                            ? IconButton(
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {
                                    _searchFocusNode.unfocus();
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFF44464F),
                                ),
                              )
                            : null,
                        suffixIcon: (isSearching || _showResults)
                            ? IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Color(0xFF44464F),
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  _searchFocusNode.unfocus();
                                  setState(() {
                                    _showResults = false;
                                  });
                                },
                              )
                            : const Icon(
                                Icons.search,
                                color: Color(0xFF44464F),
                              ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 14.0,
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          color: Color(0xFF44464F),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // Injected Suggestions Widget
                    if (isSearching)
                      SearchSuggestionsView(onSuggestionTap: _performSearch),
                  ],
                ),
              ),
              const Gap(24.0),

              // Conditional UI Rendering
              if (_showResults)
                const SearchResultsView()
              else if (!isSearching)
                SearchHomeView(
                  selectedChip: _select,
                  onChipSelected: (value) {
                    setState(() {
                      _select = value;
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
