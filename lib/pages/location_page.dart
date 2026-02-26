import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/widgets/app_gradient_background.dart';
import 'package:weather_app/widgets/current_lat_and_long_widget.dart';
import 'package:weather_app/widgets/current_location_widget.dart';
import 'package:weather_app/widgets/search_location_widget.dart';
import 'package:weather_app/widgets/submit_button_widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
  });

  final bool isNight;
  final double width, height;

  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  late double width, height;
  late TextEditingController searchController;
  double? _lat, _long;
  bool isLoading = false;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = widget.width;
    height = widget.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        isNight: widget.isNight,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, //20
            vertical: height * 0.025, //20
          ),
          child: Column(
            children: [
              /// Location Search Bar
              SearchLocationWidget(
                searchController: searchController,
                isNight: widget.isNight,
                onChanged: (value) => debugPrint("Search Location Tap $value"),
              ),
              SizedBox(height: height * 0.0225), //18
              /// Select Current Location
              CurrentLocationWidget(
                isNight: widget.isNight,
                isLoading: isLoading,
                width: width,
                height: height,
                onTap: () => debugPrint("Current Location Tap"),
              ),
              SizedBox(height: height * 0.0125), // 10
              /// Current Lat and Long.
              CurrentLatAndLongWidget(
                isNight: widget.isNight,
                width: width,
                height: height,
                lat: _lat ?? 0.00,
                long: _long ?? 0.00,
              ),
              Spacer(),

              /// Submit Button
              SubmitButtonWidget(
                isNight: widget.isNight,
                onTap: getCurrentPosition,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Snack bar method
  showSnackBar(String label) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(label)));
  }

  /// Get Current Location
  Future<void> getCurrentPosition() async {
    final String? errorMsg = await checkLocationPermission();

    if (errorMsg != null) {
      showSnackBar(errorMsg);
      return;
    }

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 50,
    );
    debugPrint("LocationSetting : ${locationSettings.accuracy}");
    debugPrint("LocationSetting : ${locationSettings.distanceFilter}");

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
    setState(() {
      _lat = position.latitude;
      _long = position.longitude;
    });
  }

  Future<String?> checkLocationPermission() async {
    bool isLocationOn = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    debugPrint("Permission: $permission");

    /// Device Location Status
    if (!isLocationOn) {
      return 'Location services are disabled.';
    } else {
      /// If denied
      if (permission == LocationPermission.denied) {
        /// Request for location
        permission = await Geolocator.requestPermission();

        /// Check Permission Status
        if (permission == LocationPermission.denied) {
          return 'Location permissions are denied';
        }
      }

      /// Check Permission Status Again  [permission = requestPermission() Here]
      if (permission == LocationPermission.deniedForever) {
        return 'Location permissions are permanently denied, we cannot request permissions.';
      }
    }
    return null;
  }
}
