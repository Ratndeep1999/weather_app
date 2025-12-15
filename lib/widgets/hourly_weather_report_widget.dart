import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'background_decorated_box_widget.dart';

class HourlyWeatherReportWidget extends StatelessWidget {
  const HourlyWeatherReportWidget({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
    required this.temperature,
    required this.icon,
    required this.hours,
    this.isCurrentHours = false,
  });

  final bool isNight;
  final double width;
  final double height;
  final String temperature;
  final String icon;
  final String hours;
  final bool? isCurrentHours;

  @override
  Widget build(BuildContext context) {
    /// Hourly Report Widget
    return BackgroundDecoratedBoxWidget(
      isNight: isNight,
      boxWidth: width * 0.18, //70
      horizontalPadding: width * 0.0,
      verticalPadding: height * 0.02, //16
      backgroundColor: isCurrentHours!
          ? (isNight ? Color(0xFF12428d) : Color(0xFF2d92cc))
          : null,
      isBorder: isCurrentHours!,
      customWidget: Column(
        children: [
          /// Temperature
          Text(
            "$temperature°C",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: height * 0.02), // 16
          /// Weather Report Icon
          SvgPicture.asset(
            icon,
            height: height * 0.05, // 40
            width: width * 0.2, // 40
          ),
          SizedBox(height: height * 0.02), // 16
          /// Hours
          Text(
            "$hours.00",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
