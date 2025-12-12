import 'package:flutter/material.dart';
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
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFF0c3a8a),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.0875,
            vertical: height * 0.0125,
          ),

          /// Activity and Details Section
          child: Row(
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
              WeatherActivityWidget(
                icon: "assets/icons/wind.svg",
                label: "19km/h",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
