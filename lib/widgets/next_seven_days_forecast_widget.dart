
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        Text.rich(
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
                    "°C\t\t\t",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

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
        ),
      ],
    );
  }
}