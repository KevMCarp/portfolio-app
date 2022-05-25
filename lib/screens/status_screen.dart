import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_status/components/dialogs/car_search_dialog.dart';
import 'package:service_status/screens/status_widgets/placeholder.dart';

import '../components/scaffold.dart';
import '../components/traffic_light_spinner.dart';
import '../models/vehicle_status.dart';
import '../services/vehicle_status_provider.dart';
import 'status_widgets/booked.dart';
import 'status_widgets/recieved.dart';

const _errorText = Text('We could not find the status of your vehicle');

class StatusScreen extends StatelessWidget {
  const StatusScreen({
    required this.vehicleRegistration,
    super.key,
  });

  final String vehicleRegistration;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: Consumer(builder: (context, ref, child) {
          final futureVehicleStatus =
              ref.watch(vehicleStatusProvider(vehicleRegistration));

          return futureVehicleStatus.when(
            loading: () {
              return const SearchSpinner();
            },
            error: (e, _) {
              return _errorText;
            },
            data: (vehicleStatus) {
              switch (vehicleStatus) {
                case VehicleStatus.booked:
                  return BookedScreen(
                    timestamp: DateTime.now(),
                  );
                case VehicleStatus.recieved:
                  return RecievedScreen(
                    timestamp: DateTime.now(),
                  );
                case VehicleStatus.workshop:
                case VehicleStatus.ready:
                case VehicleStatus.collected:
                  return const StatusPlaceholder();
                case VehicleStatus.unknown:
                  return _errorText;
              }
            },
          );
        }),
      ),
    );
  }
}
