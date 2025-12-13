import 'package:flutter/material.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';
import 'package:weather_app/widgets/hourly_weather_report_widget.dart';
import 'package:weather_app/widgets/two_items_widget.dart';

class TodayHourlyForecastSection extends StatelessWidget {
  const TodayHourlyForecastSection({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoratedBoxWidget(
      horizontalPadding: width * 0.05, //20
      verticalPadding: height * 0.02, //16
      isBorder: false,
      customWidget: Column(
        children: [
          /// first row
          TwoItemsWidget(
            firstWidget: const Text(
              "Today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            secondWidget: const Text(
              "Mar, 9",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: height * 0.025),

          /// Hourly Weather Report
          Row(
            children: [
              /// first hour report
              HourlyWeatherReportWidget(
                width: width,
                height: height,
                temperature: 29,
                icon: "assets/icons/clouds.svg",
                hours: 15,
                isSelected: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
