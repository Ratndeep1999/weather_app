/// Throw when device location service is disabled.
class LocationServiceDisabledException implements Exception {
  final String message;

  LocationServiceDisabledException([
    this.message = "Location services are disabled.",
  ]);

  @override
  String toString() => message;
}

/// Throw when location permission is denied by the user.
class LocationPermissionDeniedException implements Exception {
  final String message;

  LocationPermissionDeniedException([
    this.message = "Location permission denied.",
  ]);

  @override
  String toString() => message;
}

/// Throw when location permission is permanently denied.
class LocationPermissionForeverDeniedException implements Exception {
  final String message;

  LocationPermissionForeverDeniedException([
    this.message = "Location permission permanently denied.",
  ]);

  @override
  String toString() => message;
}
