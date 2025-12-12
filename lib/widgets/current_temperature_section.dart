import 'package:flutter/material.dart';

class CurrentTemperatureSection extends StatelessWidget {
  const CurrentTemperatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: " 28°\n",
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
            text: "Max.: 31° Min.: 25°",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
