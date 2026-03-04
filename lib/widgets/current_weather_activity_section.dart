import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';
import 'package:weather_app/widgets/weather_activity_widget.dart';

class CurrentWeatherActivitySection extends StatelessWidget {
  const CurrentWeatherActivitySection({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
    this.weatherModel,
  });

  final WeatherModel? weatherModel;
  final bool isNight;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    /// Get Current Weather Activities
    final Current? weathActi = weatherModel?.current;
    final String rain = weathActi?.precipMm?.toStringAsFixed(0) ?? "--";
    final String humidity = weathActi?.humidity?.toStringAsFixed(0) ?? "--";
    final String wind = weathActi?.windKph?.toStringAsFixed(0) ?? "--";

    return BackgroundDecoratedBoxWidget(
      isNight: isNight,
      horizontalPadding: width * 0.05, //20
      verticalPadding: height * 0.0125, //10
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// rain
          WeatherActivityWidget(icon: "assets/icons/rain.svg", label: "$rain%"),

          /// humidity
          WeatherActivityWidget(
            icon: "assets/icons/humidity.svg",
            label: "$humidity%",
          ),

          /// wind
          WeatherActivityWidget(
            icon: "assets/icons/wind.svg",
            label: "${wind}km/h",
          ),
        ],
      ),
    );
  }
}
