import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/Exceptions/location_exception.dart';

class LocationService {
  /// Check location permission and service status
  Future<void> checkPermission() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    /// Device Location Status
    if (!isLocationEnabled) throw AppLocationServiceDisabledException();

    /// Get Permission Status
    LocationPermission permission = await Geolocator.checkPermission();

    /// If denied
    if (permission == LocationPermission.denied) {
      /// Store requestPermission()
      permission = await Geolocator.requestPermission();

      /// Ask Permission and Store Status
      if (permission == LocationPermission.denied) {
        throw AppLocationPermissionDeniedException();
      }
    }

    /// Ask Permission Again and Store Status
    if (permission == LocationPermission.deniedForever) {
      throw AppLocationPermissionForeverDeniedException();
    }
  }

  /// Get current device location
  Future<Position> getCurrentLocation() async {
    await checkPermission();

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 50,
    );

    /// Get lat and long
    final position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
    return position;
  }
}
