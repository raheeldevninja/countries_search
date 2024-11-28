import 'package:countries_search/core/app.dart';
import 'package:countries_search/features/countries_search/view_model/countries_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountriesProvider()),
      ],
      child: const SearchCountriesApp(),
    ),
  );
}
