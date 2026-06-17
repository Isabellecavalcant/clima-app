class City {
  String name;
  String country;
  String countryCode;
  double lat;
  double lon;

  double? temp;
  int? weatherCode;
  String? imageUrl;

  City({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    this.countryCode = '',
    this.temp,
    this.weatherCode,
    this.imageUrl,
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
    other is City &&
        lat.toStringAsFixed(2) == other.lat.toStringAsFixed(2) &&
        lon.toStringAsFixed(2) == other.lon.toStringAsFixed(2);

@override
int get hashCode => Object.hash(
      lat.toStringAsFixed(2),
      lon.toStringAsFixed(2),
    );
}