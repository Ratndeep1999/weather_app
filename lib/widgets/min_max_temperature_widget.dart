import 'package:flutter/material.dart';
import 'package:weather_app/commons/text_styles.dart';

class MinMaxTemperatureWidget extends StatelessWidget {
  const MinMaxTemperatureWidget({
    super.key,
    required this.isNight,
    required this.maxTemperature,
    required this.minTemperature,
  });

  final bool isNight;
  final String maxTemperature;
  final String minTemperature;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          /// Max Temperature
          TextSpan(text: maxTemperature, style: TextStyles.alegreyaSansMedium),
          WidgetSpan(
            child: Transform.translate(
              offset: Offset(0, -4),
              child: Text(
                "°C",
                style: TextStyles.alegreyaSansMedium.copyWith(fontSize: 12.0),
              ),
            ),
          ),

          // space
          const TextSpan(text: "\t\t"),

          /// Min Temperature
          TextSpan(
            text: minTemperature,
            style: TextStyles.alegreyaSansMedium.copyWith(
              color: isNight ? Color(0xFF8499c2) : Color(0xFF91cce3),
            ),
          ),
          WidgetSpan(
            child: Transform.translate(
              offset: Offset(0, -4),
              child: Text(
                "°C",
                style: TextStyles.alegreyaSansMedium.copyWith(
                  fontSize: 12,
                  color: isNight ? Color(0xFF8499c2) : Color(0xFF91cce3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
