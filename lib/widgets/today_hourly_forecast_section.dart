import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';
import 'package:weather_app/widgets/hourly_weather_report_widget.dart';
import 'package:weather_app/widgets/today_hourly_forecast_first_row_widget.dart';

class TodayHourlyForecastSection extends StatelessWidget {
  const TodayHourlyForecastSection({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
    required this.today,
    required this.weatherModel,
  });

  final WeatherModel? weatherModel;
  final bool isNight;
  final double width;
  final double height;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    /// Get Forecast Day Forecast Hours
    final hours = weatherModel?.forecast!.forecastday?[0].hour;
    final hoursLength = hours?.length;

    return BackgroundDecoratedBoxWidget(
      isNight: isNight,
      horizontalPadding: width * 0.04, //16
      verticalPadding: height * 0.02, //16
      customWidget: Column(
        children: [
          /// First Row
          TodayHourlyForecastFirstRowWidget(today: today),
          SizedBox(height: height * 0.02), //16
          /// Hourly Weather Report
          SizedBox(
            height: height * 0.2125,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hoursLength,
              itemBuilder: (BuildContext context, int index) {
                /// Get Specific Hour Item
                final hour = hours?[index];
                final temp = hour?.tempC?.toStringAsFixed(0) ?? "--";
                final icon = hour?.condition?.icon ?? '';

                /// Hourly Weather Report Item
                return HourlyWeatherReportWidget(
                  isNight: isNight,
                  width: width,
                  height: height,
                  temperature: temp,
                  icon: icon,
                  isCurrentHours: index == 0,
                  hours: _getCurrentHur(hur: index, isCurrHur: (index == 0)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Returns formatted time (HH:mm) by adding [hours] to [today].
  String _getCurrentHur({required int hur, required bool isCurrHur}) {
    final time = today.add(Duration(hours: hur));

    /// Converts 24 to 12 Hours
    final istHours = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final hour = istHours.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, "0");
    return isCurrHur ? "$hour:$minutes" : "$hour:00";
  }
}
