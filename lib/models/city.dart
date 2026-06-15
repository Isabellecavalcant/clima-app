class City {
  String name;
  String country;
  String countryCode;
  double lat;
  double lon;

  double? temp;
  int? weatherCode;

  City({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    this.countryCode = '',
    this.temp,
    this.weatherCode,
  });

  String get flag {
    if (countryCode.length != 2) {
      return '🌍';
    }

    final code = countryCode.toUpperCase();

    return String.fromCharCodes(
      code.codeUnits.map((letter) => letter + 127397),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is City && other.name == name && other.country == country;

  @override
  int get hashCode => Object.hash(name, country);
}