import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> country;

  const CountryDetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(country['flag'], width: 150, height: 100),
            const SizedBox(height: 20),
            Text('Name: ${country['name']}'),
            Text('Region: ${country['region']}'),
            Text('Population: ${country['population']}'),
          ],
        ),
      ),
    );
  }
}