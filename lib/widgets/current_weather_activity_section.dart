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
    return BackgroundDecoratedBoxWidget(
      isNight: isNight,
      horizontalPadding: width * 0.05, //20
      verticalPadding: height * 0.0125, //10
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// rain
          WeatherActivityWidget(
            icon: "assets/icons/rain.svg",
            label: "${weatherModel?.current?.precipMm?.toStringAsFixed(0) ?? "--"}%",
          ),

          /// humidity
          WeatherActivityWidget(
            icon: "assets/icons/humidity.svg",
            label: "${weatherModel?.current?.humidity ?? "--"}%",
          ),

          /// wind
          WeatherActivityWidget(
            icon: "assets/icons/wind.svg",
            label: "${weatherModel?.current?.windKph?.toStringAsFixed(0) ?? "--"}km/h",
          ),
        ],
      ),
    );
  }
}
