import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/city.dart';

class WeatherService {
  Future<Map<String, dynamic>> getWeather(
    double lat,
    double lon,
  ) async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
      '?latitude=$lat'
      '&longitude=$lon'
      '&current=temperature_2m,weather_code',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception('Erro ao carregar clima');
  }

  Future<List<City>> searchCity(String cityName) async {
    final url = Uri.parse(
      'https://geocoding-api.open-meteo.com/v1/search'
      '?name=$cityName'
      '&count=10',
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar cidade');
    }

    final data = jsonDecode(response.body);

    if (data['results'] == null) {
      return [];
    }

    return (data['results'] as List)
        .map(
          (item) => City(
            name: item['name'],
            country: item['country'] ?? '',
            countryCode: item['country_code'] ?? '',
            lat: item['latitude'].toDouble(),
            lon: item['longitude'].toDouble(),
          ),
        )
        .toList();
  }
}