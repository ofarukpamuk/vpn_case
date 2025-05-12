import '../../domain/location_entity.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<Location> locationList;

  LocationLoaded(this.locationList);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
