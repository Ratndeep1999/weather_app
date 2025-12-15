import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'min_max_temperature_widget.dart';

class NextSevenDaysForecastWidget extends StatelessWidget {
  const NextSevenDaysForecastWidget({
    super.key,
    required this.isNight,
    required this.height,
    required this.width,
    required this.forecastDay,
    required this.weatherIcon,
    required this.minTemperature,
    required this.maxTemperature,
  });

  final bool isNight;
  final double height;
  final double width;
  final String forecastDay;
  final String weatherIcon;
  final String minTemperature;
  final String maxTemperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Day
        Text(
          forecastDay,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        /// Weather Report
        SvgPicture.asset(
          weatherIcon,
          height: height * 0.0375, //30
          width: width * 0.075, //30
        ),

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
