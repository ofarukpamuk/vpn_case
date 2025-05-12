import '../domain/location_entity.dart';

import '../domain/location_entity.dart';

class MockLocationRepository {
  List<Location> getLocations() {
    return [
      Location(
        flagAsset: 'assets/flags/germany.svg',
        countryName: 'Almanya',
        locationCount: 3,
      ),
      Location(
        flagAsset: 'assets/flags/italy.svg',
        countryName: 'İtalya',
        locationCount: 2,
      ),
      Location(
        flagAsset: 'assets/flags/netherlands.svg',
        countryName: 'Türkiye',
        locationCount: 5,
      ),
    ];
  }
}
