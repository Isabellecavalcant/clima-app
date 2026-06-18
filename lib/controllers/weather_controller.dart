import 'package:flutter/material.dart';

import '../models/city.dart';
import '../services/weather_service.dart';

class WeatherController {
  final WeatherService service = WeatherService();

  final ValueNotifier<List<City>> favorites = ValueNotifier([]);

  final ValueNotifier<List<City>> searchResults = ValueNotifier([]);

  final List<City> cities = [
    City(
      name: "Natal",
      country: "Brasil",
      countryCode: "BR",
      state: "Rio Grande do Norte",
      lat: -5.79,
      lon: -35.20,
    ),
    City(
      name: "Paris",
      country: "França",
      countryCode: "FR",
      state: "Île-de-France",
      lat: 48.85,
      lon: 2.35,
    ),
    City(
      name: "Tóquio",
      country: "Japão",
      countryCode: "JP",
      state: "Tóquio",
      lat: 35.68,
      lon: 139.69,
    ),
    City(
      name: "Nova York",
      country: "EUA",
      countryCode: "US",
      state: "New York",
      lat: 40.71,
      lon: -74.00,
    ),
  ];

  Future<void> loadWeather(City city) async {
    final data = await service.getWeather(city.lat, city.lon);

    city.temp = data['current']['temperature_2m'];
    city.weatherCode = data['current']['weather_code'];
  }

  void toggleFavorite(City city) async {
  final list = List<City>.from(favorites.value);

  if (list.contains(city)) {
      list.remove(city);
    } else {
      list.add(city);
    }

    favorites.value = list;
  }

  bool addCity(City city) {
  final exists = cities.any(
    (c) =>
        (c.lat - city.lat).abs() < 0.1 &&
        (c.lon - city.lon).abs() < 0.1,
  );

  if (!exists) {
    cities.add(city);
    return true;
  }

  return false;
}

String normalizeText(String text) {
  return text
      .toLowerCase()
      .replaceAll('á', 'a')
      .replaceAll('à', 'a')
      .replaceAll('ã', 'a')
      .replaceAll('â', 'a')
      .replaceAll('é', 'e')
      .replaceAll('ê', 'e')
      .replaceAll('í', 'i')
      .replaceAll('ó', 'o')
      .replaceAll('ô', 'o')
      .replaceAll('õ', 'o')
      .replaceAll('ú', 'u')
      .replaceAll('ç', 'c')
      .trim();
}

  Future<void> searchCity(String cityName) async {
    final result = await service.searchCity(cityName);

    final uniqueResults = <City>[];

    for (final city in result) {
      final exists = uniqueResults.any((c) {
        final sameName =
            normalizeText(c.name) == normalizeText(city.name);

        final sameState =
            normalizeText(c.state) == normalizeText(city.state);

        final sameCountry =
            c.countryCode.toUpperCase() ==
            city.countryCode.toUpperCase();

        final nearCoordinates =
            (c.lat - city.lat).abs() < 0.05 &&
            (c.lon - city.lon).abs() < 0.05;

        return sameName &&
            sameState &&
            sameCountry &&
            nearCoordinates;
      });

      if (!exists) {
        uniqueResults.add(city);
      }
    }

    searchResults.value = uniqueResults;
  }
}

final controller = WeatherController();