import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'min_max_temperature_widget.dart';

class NextSevenDaysForecastWidget extends StatelessWidget {
  const NextSevenDaysForecastWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Day
        Text(
          "Monday",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        /// Weather Report
        SvgPicture.asset(
          "assets/icons/sun_cloud.svg",
          height: height * 0.0375, //30
          width: width * 0.075, //30
        ),

        /// Min And Max Temperature
        MinMaxTemperatureWidget(),
      ],
    );
  }
}
