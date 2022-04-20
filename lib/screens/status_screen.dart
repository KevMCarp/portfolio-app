import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_status/screens/status_widgets/recieved.dart';

import '../components/scaffold.dart';
import '../models/vehicle_status.dart';
import '../services/vehicle_status_provider.dart';
import 'status_widgets/booked.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: Consumer(builder: (context, ref, child) {
          final vehicleStatus = ref.watch(vehicleStatusProvider);

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
              return Container();
            case VehicleStatus.unknown:
              return Text('We could not find the status of your vehicle');
          }
        }),
      ),
    );
  }
}
