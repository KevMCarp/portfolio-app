import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_status/models/vehicle_status.dart';

final vehicleStatusProvider =
    StateProvider.autoDispose((ref) => VehicleStatus.recieved);
