import 'package:flutter/material.dart';

class MinMaxTemperatureWidget extends StatelessWidget {
  const MinMaxTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          /// Max Temperature
          TextSpan(
            text: "13",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          WidgetSpan(
            child: Transform.translate(
              offset: Offset(0, -4),
              child: Text(
                "°C",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // space
          const TextSpan(text: "\t\t"),

          /// Min Temperature
          TextSpan(
            text: "10",
            style: TextStyle(
              color: Color(0xFF8499c2),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          WidgetSpan(
            child: Transform.translate(
              offset: Offset(0, -4),
              child: Text(
                "°C",
                style: TextStyle(
                  color: Color(0xFF8499c2),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
