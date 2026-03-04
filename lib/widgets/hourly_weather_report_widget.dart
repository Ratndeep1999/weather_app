import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_icon.dart';
import '../commons/text_styles.dart';
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
  final bool isCurrentHours;

  @override
  Widget build(BuildContext context) {
    /// Hourly Report Widget
    return Padding(
      padding: EdgeInsets.only(right: width * 0.032), // 12
      child: BackgroundDecoratedBoxWidget(
        isNight: isNight,
        boxWidth: width * 0.18, // 70
        horizontalPadding: width * 0.0,
        verticalPadding: height * 0.02, // 16
        backgroundColor: isCurrentHours
            ? (isNight ? Color(0xFF12428d) : Color(0xFF2d92cc))
            : null,
        isBorder: isCurrentHours,
        customWidget: Column(
          children: [
            /// Temperature
            Text("$temperature°C", style: TextStyles.sfProRegular),
            SizedBox(height: height * 0.02), // 16
            /// Weather Report Icon
            WeatherIcon(iconSize: height * 0.055, icon: icon),
            SizedBox(height: height * 0.02), // 16
            /// Hours
            Text(hours, style: TextStyles.sfProRegular),
          ],
        ),
      ),
    );
  }
}
