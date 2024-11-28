import 'dart:async';
import 'dart:convert';
import 'package:countries_search/core/apis.dart';
import 'package:http/http.dart' as http;

class CountriesService {

  Future<List<dynamic>> searchCountries(String query) async {

    String url = APIs.getCountriesByName;

    try {
      final response = await http.get(Uri.parse('$url$query'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      else if(response.statusCode == 404) {
        throw Exception('No country found');
      }
      else {
        throw Exception('Failed to fetch countries');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}
