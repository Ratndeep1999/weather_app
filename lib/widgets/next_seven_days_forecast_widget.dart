import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_icon.dart';
import '../commons/text_styles.dart';
import 'min_max_temperature_widget.dart';

class NextSevenDaysForecastWidget extends StatelessWidget {
  const NextSevenDaysForecastWidget({
    super.key,
    required this.isNight,
    required this.height,
    required this.width,
    required this.forecastDay,
    required this.icon,
    required this.minTemperature,
    required this.maxTemperature,
  });

  final bool isNight;
  final double height;
  final double width;
  final String forecastDay;
  final String icon;
  final String minTemperature;
  final String maxTemperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Day
        Expanded(
          child: Text(
            forecastDay,
            style: TextStyles.alegreyaSansBold,
          ),
        ),

        /// Weather Report Icon
        WeatherIcon(icon: icon, iconSize: height * 0.033),
        SizedBox(width: width * 0.155),
        /// Min And Max Temperature
        MinMaxTemperatureWidget(
          isNight: isNight,
          maxTemperature: maxTemperature,
          minTemperature: minTemperature,
        ),
      ],
    );
  }
}
