import 'package:flutter/material.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';
import 'package:weather_app/widgets/hourly_weather_report_widget.dart';
import 'package:weather_app/widgets/today_hourly_forecast_first_row_widget.dart';

class TodayHourlyForecastSection extends StatelessWidget {
  const TodayHourlyForecastSection({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
  });

  final bool isNight;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoratedBoxWidget(
      horizontalPadding: width * 0.04, //16
      verticalPadding: height * 0.02, //16
      customWidget: Column(
        children: [
          /// First Row
          TodayHourlyForecastFirstRowWidget(),
          SizedBox(height: height * 0.02), //16
          /// Hourly Weather Report
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// First Hour Report
              HourlyWeatherReportWidget(
                width: width,
                height: height,
                temperature: isNight ? "29" : "31",
                icon: "assets/icons/sunny_cloud.svg",
                hours: "15",
                isSelected: false,
              ),

              /// Second Hour Report
              HourlyWeatherReportWidget(
                width: width,
                height: height,
                temperature: isNight ? "26" : "30",
                icon: "assets/icons/rain_cloud.svg",
                hours: "16",
                isSelected: false,
              ),

              /// Third Hour Report
              HourlyWeatherReportWidget(
                width: width,
                height: height,
                temperature: isNight ? "24" : "28",
                icon: "assets/icons/thunder.svg",
                hours: "17",
                isSelected: true,
              ),

              /// Fourth Hour Report
              HourlyWeatherReportWidget(
                width: width,
                height: height,
                temperature: isNight ? "23" : "28",
                icon: "assets/icons/moon_cloud.svg",
                hours: "18",
                isSelected: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
