import 'package:flutter/material.dart';

import '../models/city.dart';

class DetailScreen extends StatelessWidget {
  final City city;

  const DetailScreen({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              city.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "${city.temp ?? '--'} °C",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 10),
            Text(city.country),
          ],
        ),
      ),
    );
  }
}