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
  final LocationService _locationService = LocationService();
  late TextEditingController searchController;
  late double width, height;
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
  void dispose() {
    searchController.dispose();
    super.dispose();
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
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  /// Submit Button
  Future<void> submit() async {
    final NetworkService _networkService = NetworkService();
    String q = searchController.text.isNotEmpty
        ? searchController.text
        : "$_lat,$_long";
    final WeatherModel? weatherModel = await _networkService.getForecastData(
      q : q
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
