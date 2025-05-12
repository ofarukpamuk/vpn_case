import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/mock_location_repository.dart';
import '../../domain/location_entity.dart';
import 'location_event.dart';
import 'location_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'location_event.dart';
import 'location_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final MockLocationRepository repository;

  LocationBloc(this.repository) : super(LocationInitial()) {
    on<LoadLocations>(_onLoadLocations);
  }

  Future<void> _onLoadLocations(
    LoadLocations event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());

    try {
      final List<Location> locations = repository.getLocations();

      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // yükleniyor efekti

      emit(LocationLoaded(locations));
    } catch (e) {
      emit(LocationError('Lokasyonlar yüklenemedi'));
    }
  }
}
