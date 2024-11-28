import 'package:countries_search/features/countries_search/service/countries_service.dart';
import 'package:flutter/material.dart';

class CountriesProvider extends ChangeNotifier {

  final CountriesService _service = CountriesService();

  List<Map<String, dynamic>> _countries = [];
  bool _isLoading = false;
  String _error = '';

  List<Map<String, dynamic>> get countries => _countries;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> searchCountries(String query) async {
    if (query.isEmpty) {
      _countries = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final result = await _service.searchCountries(query);
      _countries = result
          .map((country) => {
        'name': country['name']['common'],
        'flag': country['flags']['png'],
        'region': country['region'],
        'population': country['population'],
      })
          .toList();
    } catch (e) {
      _error = e.toString();
      _countries = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


}