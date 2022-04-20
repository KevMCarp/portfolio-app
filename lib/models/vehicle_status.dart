enum VehicleStatus {
  /// The vehicle has been booked in, but
  /// has not yet been recieved at the garage
  booked,

  /// The vehicle has been recieved by the garage
  /// and is awaiting the garage to start work
  recieved,

  /// The vehicle is being worked on
  workshop,

  /// The work has been completed and the vehicle
  /// is ready for collection
  ready,

  /// The vehicle has been collected by the customer
  collected,

  /// The vehicle could not be found in the system
  unknown,
}
