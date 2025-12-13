import 'package:flutter/material.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';
import 'package:weather_app/widgets/weather_activity_widget.dart';

class CurrentWeatherActivitySection extends StatelessWidget {
  const CurrentWeatherActivitySection({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoratedBoxWidget(
      horizontalPadding: width * 0.05, //20
      verticalPadding: height * 0.0125, //10
      isBorder: false,
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// rain
          WeatherActivityWidget(icon: "assets/icons/rain.svg", label: "6%"),

          /// humidity
          WeatherActivityWidget(
            icon: "assets/icons/humidity.svg",
            label: "90%",
          ),

          /// wind
          WeatherActivityWidget(icon: "assets/icons/wind.svg", label: "19km/h"),
        ],
      ),
    );
  }
}
