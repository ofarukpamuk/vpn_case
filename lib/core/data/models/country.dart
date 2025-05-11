class Country {
  final String name;
  final String flag; // assets/flags/italy.png
  final String city;
  final int locationCount;
  final int strength;
  final bool isConnected;

  Country({
    required this.name,
    required this.flag,
    this.city = '',
    required this.locationCount,
    required this.strength,
    this.isConnected = false,
  });
}
