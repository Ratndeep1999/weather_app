import 'package:flutter/material.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';
import 'package:weather_app/widgets/weather_activity_widget.dart';

class CurrentWeatherActivitySection extends StatelessWidget {
  const CurrentWeatherActivitySection({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
  });

  final bool isNight;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoratedBoxWidget(
      horizontalPadding: width * 0.05, //20
      verticalPadding: height * 0.0125, //10
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// rain
          WeatherActivityWidget(
            icon: "assets/icons/rain.svg",
            label: isNight ? "6%" : "18%",
          ),

          /// humidity
          WeatherActivityWidget(
            icon: "assets/icons/humidity.svg",
            label: isNight ? "90%" : "67%",
          ),

          /// wind
          WeatherActivityWidget(
            icon: "assets/icons/wind.svg",
            label: isNight ? "19km/h" : "25km/h",
          ),
        ],
      ),
    );
  }
}
