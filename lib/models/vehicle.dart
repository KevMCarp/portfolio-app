import 'package:service_status/models/vehicle_status.dart';

class Vehicle {
  /// The vehicle registration number
  final String registration;

  final VehicleStatus status;

  const Vehicle({
    required this.registration,
    required this.status,
  });

  /// Upper case without spaces to aid lookup in the database
  String get regSearch => registration.replaceAll(' ', '').toUpperCase();

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    final status = VehicleStatus.values.firstWhere(
      (e) => e.name == json['status'],
      orElse: () => VehicleStatus.unknown,
    );

    return Vehicle(
      registration: json['registration'],
      status: status,
    );
  }
}
