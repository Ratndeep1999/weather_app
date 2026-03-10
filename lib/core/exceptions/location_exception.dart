/// Throw when device location service is disabled.
class AppLocationServiceDisabledException implements Exception {
  final String message;

  AppLocationServiceDisabledException([
    this.message = "Location services are disabled.",
  ]);

  @override
  String toString() => message;
}

/// Throw when location permission is denied by the user.
class AppLocationPermissionDeniedException implements Exception {
  final String message;

  AppLocationPermissionDeniedException([
    this.message = "Location permission denied.",
  ]);

  @override
  String toString() => message;
}

/// Throw when location permission is permanently denied.
class AppLocationPermissionForeverDeniedException implements Exception {
  final String message;

  AppLocationPermissionForeverDeniedException([
    this.message = "Location permission permanently denied.",
  ]);

  @override
  String toString() => message;
}
