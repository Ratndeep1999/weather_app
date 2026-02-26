import 'package:flutter/material.dart';
import 'package:weather_app/commons/text_styles.dart';
import 'package:weather_app/widgets/app_gradient_background.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';
import 'package:weather_app/widgets/current_location_widget.dart';
import 'package:weather_app/widgets/search_location_widget.dart';

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
                onTap: () {},
              ),
              SizedBox(height: 30),

              /// Select Current Location
              CurrentLocationWidget(
                isNight: widget.isNight,
                width: width,
                height: height,
                onTap: () {},
              ),
              SizedBox(height: 30),

              /// Current Lat and Long.
              CurrentLatAndLongWidget(
                isNight: widget.isNight,
                width: width,
                height: height,
              ),

              Spacer(),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      widget.isNight ? Color(0xFF0c3a8a) : Color(0xFF278dc4),
                    ),
                  ),
                  child: Text("Submit", style: TextStyles.alegreyaSansBold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentLatAndLongWidget extends StatelessWidget {
  const CurrentLatAndLongWidget({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
  });

  final bool isNight;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoratedBoxWidget(
      isNight: isNight,
      horizontalPadding: width * 0.05,
      verticalPadding: height * 0.0125,
      customWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Latitude
          Text("Latitude : 0.0", style: TextStyles.alegreyaSansBold),

          /// Longitude
          Text("Longitude : 0.0", style: TextStyles.alegreyaSansBold),
        ],
      ),
    );
  }
}
