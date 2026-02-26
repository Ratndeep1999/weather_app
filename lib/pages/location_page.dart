import 'package:flutter/material.dart';
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
              SizedBox(height: 30),

              /// Select Current Location
              CurrentLocationWidget(
                isNight: widget.isNight,
                width: width,
                height: height,
                onTap: () => debugPrint("Current Location Tap"),
              ),
              SizedBox(height: 30),

              /// Current Lat and Long.
              CurrentLatAndLongWidget(
                isNight: widget.isNight,
                width: width,
                height: height,
                lat: 0.0,
                long: 0.0,
              ),
              Spacer(),

              /// Submit Button
              SubmitButtonWidget(
                isNight: widget.isNight,
                onTap: () => debugPrint("Submit Button Tap"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
