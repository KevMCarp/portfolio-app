import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vehicle_status.dart';
import '../utils/extension_methods.dart';

final vehicleStatusProvider = FutureProvider.autoDispose((ref) async {
  await Future.delayed(1.seconds);

  final random = Random.secure();
  const values = VehicleStatus.values;

  return values[random.nextInt(values.length - 1)];
});
