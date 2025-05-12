import 'package:vpn_case/core/data/models/connection_stats.dart';
import 'package:vpn_case/core/data/models/country.dart';

final mockCountries = [
  Country(
    name: 'Italy',
    flag: 'assets/flags/italy.svg',
    city: '',
    locationCount: 4,
    strength: 70,
  ),
  Country(
    name: 'Netherlands',
    flag: 'assets/flags/netherlands.svg',
    city: 'Amsterdam',
    locationCount: 12,
    strength: 85,
    isConnected: true,
  ),
  Country(
    name: 'Germany',
    flag: 'assets/flags/germany.svg',
    city: '',
    locationCount: 10,
    strength: 90,
  ),
];

final mockConnectionStats = ConnectionStats(
  downloadSpeed: 527,
  uploadSpeed: 49,
  connectedTime: Duration(hours: 2, minutes: 41, seconds: 52),
  connectedCountry: mockCountries[1], // Netherlands
);
