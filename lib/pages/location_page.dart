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
                onTap: getCurrentPosition,
              ),
              SizedBox(height: height * 0.0125), // 10
              /// Current Lat and Long.
              CurrentLatAndLongWidget(
                isNight: widget.isNight,
                isLoading: isLoading,
                width: width,
                height: height,
                lat: _lat ?? 0.00,
                long: _long ?? 0.00,
              ),
              Spacer(),

              /// Submit Button
              SubmitButtonWidget(isNight: widget.isNight, onTap: submit),
            ],
          ),
        ),
      ),
    );
  }

  /// Get Current Location
  Future<void> getCurrentPosition() async {
    final String? errorMsg = await checkLocationPermission();

    if (errorMsg != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMsg)));
      return;
    }
    setState(() => isLoading = true);

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 50,
    );

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    setState(() {
      isLoading = false;
      _lat = position.latitude;
      _long = position.longitude;
    });
  }

  /// Location Permission
  Future<String?> checkLocationPermission() async {
    bool isLocationOn = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    debugPrint("Permission: $permission");

    /// Device Location Status
    if (!isLocationOn) return 'Location services are disabled.';

    /// If denied
    if (permission == LocationPermission.denied) {
      /// Store requestPermission()
      permission = await Geolocator.requestPermission();

      /// Ask Permission and Store Status
      if (permission == LocationPermission.denied) {
        return 'Location permissions are denied';
      }
    }

    /// Ask Permission Again and Store Status
    if (permission == LocationPermission.deniedForever) {
      return 'Location permissions are permanently denied, we cannot request permissions.';
    }

    return null;
  }

  /// Submit Button
  void submit() {
    Navigator.pop(context,_lat);
  }
}
