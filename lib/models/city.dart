class City {
  String name;
  String country;
  double lat;
  double lon;

  double? temp;
  int? weatherCode;

  City({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    this.temp,
    this.weatherCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is City && other.name == name;

  @override
  int get hashCode => name.hashCode;
}