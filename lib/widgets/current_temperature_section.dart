import 'package:flutter/material.dart';

class CurrentTemperatureSection extends StatelessWidget {
  const CurrentTemperatureSection({super.key, required this.isNight});

  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: isNight ? " 28°\n" : " 30°\n",
        style: TextStyle(
          color: Colors.white,
          fontSize: 80,
          fontWeight: FontWeight.w500,
        ),
        semanticsLabel: "Temperature",
        children: [
          TextSpan(
            text: "Precipitations\n",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: isNight ? "Max.: 31°   Min.: 25°" : "Max.: 34°   Min.: 28°",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
