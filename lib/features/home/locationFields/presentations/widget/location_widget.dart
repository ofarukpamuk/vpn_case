import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../custom_list_tile.dart' show CustomCountryTile;
import '../bloc/location_bloc.dart';
import '../bloc/location_state.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationLoaded) {
          final locations = state.locationList;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: locations.length,
            itemBuilder: (context, index) {
              final location = locations[index];

              return CustomCountryTile(
                flagAsset: location.flagAsset,
                countryName: location.countryName,
                locationCount: location.locationCount,
                onConnectTap: () {
                  print("Bağlan: ${location.countryName}");
                },
                onDetailsTap: () {
                  print("Detay: ${location.countryName}");
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
