import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Services/location_service.dart';
import 'package:weather_app/Services/network_service.dart';
import 'package:weather_app/core/Exceptions/location_exception.dart';
import 'package:weather_app/models/weatherModel.dart';
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
    final LocationService _locationService = LocationService();
    try {
      setState(() => isLoading = true);

      final Position position = await _locationService.getCurrentLocation();

      setState(() {
        isLoading = false;
        _lat = position.latitude;
        _long = position.longitude;
      });
    } on AppLocationServiceDisabledException catch (e) {
      _showError(e.message);
    } on AppLocationPermissionDeniedException catch (e) {
      _showError(e.message);
    } on AppLocationPermissionForeverDeniedException catch (e) {
      _showError(e.message);
    } catch (e) {
      _showError("Failed to get location");
    }
  }

  /// Submit Button
  Future<void> submit() async {
    NetworkService networkService = NetworkService();

    /// Pass 'lat' and 'long' and get weatherModel with data
    final WeatherModel? weatherModel = await networkService.getForecastData(
      lat: _lat ?? 0.0,
      long: _long ?? 0.0,
    );

    /// Return "weatherModel" to HomePage
    Navigator.pop(context, weatherModel);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
