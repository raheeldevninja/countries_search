import 'package:countries_search/features/countries_search/country_details_screen.dart';
import 'package:countries_search/features/countries_search/view_model/countries_provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class CountriesSearchScreen extends StatefulWidget {
  const CountriesSearchScreen({super.key});

  @override
  State<CountriesSearchScreen> createState() => _CountriesSearchScreenState();
}

class _CountriesSearchScreenState extends State<CountriesSearchScreen> {

  final TextEditingController _searchController = TextEditingController();
  late final CountriesProvider _countryProvider;

  @override
  void initState() {
    super.initState();

    _countryProvider = Provider.of<CountriesProvider>(context, listen: false);

    // debounce logic
    _searchController.addListener(() {
      Future.delayed(const Duration(milliseconds: 300), () {
        _countryProvider.searchCountries(_searchController.text.trim());
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    //countries provider
    final countryProvider = Provider.of<CountriesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Country Search')),
      body: Column(
        children: [

          //countries text field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search country',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          //countries listview
          Expanded(
            child: countryProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : countryProvider.error.isNotEmpty
                ? Center(child: Text(countryProvider.error))
                : countryProvider.countries.isEmpty
                ? const Center(child: Text('No countries found.'))
                : ListView.builder(
              itemCount: countryProvider.countries.length,
              itemBuilder: (context, index) {
                final country = countryProvider.countries[index];
                return ListTile(
                  leading: Image.network(
                    country['flag'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(country['name']),
                  subtitle: Text(country['region']),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CountryDetailScreen(
                          country: country,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {

    //dispose search controller
    _searchController.dispose();

    super.dispose();
  }
}
