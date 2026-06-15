import 'package:flutter/material.dart';

import '../models/city.dart';

class DetailScreen extends StatelessWidget {
  final City city;

  const DetailScreen({
    super.key,
    required this.city,
  });

  IconData getWeatherIcon(int? code) {
    if (code == null) {
      return Icons.help_outline;
    }

    // Céu limpo
    if (code == 0) {
      return Icons.wb_sunny;
    }

    // Parcialmente nublado / nublado
    if (code >= 1 && code <= 3) {
      return Icons.cloud;
    }

    // Nevoeiro
    if (code == 45 || code == 48) {
      return Icons.cloud;
    }

    // Chuva
    if ((code >= 51 && code <= 67) ||
        (code >= 80 && code <= 82)) {
      return Icons.water_drop;
    }

    // Neve
    if (code >= 71 && code <= 77) {
      return Icons.ac_unit;
    }

    // Tempestade
    if (code >= 95 && code <= 99) {
      return Icons.thunderstorm;
    }

    return Icons.cloud;
  }

  String getWeatherDescription(int? code) {
    if (code == null) {
      return "Clima desconhecido";
    }

    if (code == 0) {
      return "Ensolarado";
    }

    if (code >= 1 && code <= 3) {
      return "Nublado";
    }

    if (code == 45 || code == 48) {
      return "Nevoeiro";
    }

    if ((code >= 51 && code <= 67) ||
        (code >= 80 && code <= 82)) {
      return "Chuvoso";
    }

    if (code >= 71 && code <= 77) {
      return "Nevando";
    }

    if (code >= 95 && code <= 99) {
      return "Tempestade";
    }

    return "Clima indefinido";
  }

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

            Icon(
              getWeatherIcon(city.weatherCode),
              size: 100,
            ),

            const SizedBox(height: 10),

            Text(
              getWeatherDescription(city.weatherCode),
              style: const TextStyle(
                fontSize: 20,
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

            Text(
              "${city.flag} ${city.country}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}