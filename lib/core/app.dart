import 'package:countries_search/features/countries_search/countries_search_screen.dart';
import 'package:flutter/material.dart';

class SearchCountriesApp extends StatelessWidget {
  const SearchCountriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Search Countries',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CountriesSearchScreen(),
    );
  }
}
