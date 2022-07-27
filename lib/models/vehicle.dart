import 'package:service_status/models/vehicle_status.dart';

class Vehicle {
  /// The vehicle registration number
  final String registration;

  /// Not null if [status] is one of the following statuses
  ///
  /// booked, recieved, workshop,
  final DateTime? timestamp;

  final VehicleStatus status;

  const Vehicle._({
    required this.registration,
    required this.status,
    required this.timestamp,
  });

  /// Upper case without spaces to aid lookup in the database
  String get regSearch => registration.replaceAll(' ', '').toUpperCase();

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    final status = VehicleStatus.values.firstWhere(
      (e) => e.name == json['status'],
      orElse: () => VehicleStatus.unknown,
    );

    return Vehicle._(
        registration: json['registration'],
        status: status,
        timestamp: json['timestamp']);
  }
}
