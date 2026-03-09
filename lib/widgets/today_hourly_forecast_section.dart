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
    required this.weatherModel,
  });

  final WeatherModel? weatherModel;
  final bool isNight;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();

    /// Get Forecast Day Forecast Hours
    final hours = weatherModel?.forecast?.forecastday?[0].hour;

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
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: hours?.length ?? 0,
              separatorBuilder: (_, index) => SizedBox(width: width * 0.032),
              itemBuilder: (BuildContext context, int index) {
                /// Get Specific Hour Item
                final hour = hours?[index];
                final temp = hour?.tempC?.toStringAsFixed(0) ?? "--";
                final icon = hour?.condition?.icon ?? '';

                /// Get hours from api and local device  (HH)
                final apiHur = hour?.time?.hour ?? 00;
                final localHur = today.hour;

                /// Check both hours is same and get minutes base on condition
                final bool isSame = (apiHur == localHur);
                final locMin = "${isSame ? today.minute : 0}".padLeft(2, '0');

                /// Get 12 Hur Format (HH) from 24 Hur
                final intHur = apiHur == 0
                    ? 0
                    : (apiHur % 12 == 0 ? 12 : apiHur % 12);
                final hur = intHur.toString().padLeft(2, '0');

                /// Hourly Weather Report Item
                return HourlyWeatherReportWidget(
                  isNight: isNight,
                  width: width,
                  height: height,
                  temperature: temp,
                  icon: icon,
                  isCurrentHours: isSame,
                  hours: "$hur:$locMin",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// get Hourly items length
  static int? getHourlyItemLength(weatherModel) {
    return weatherModel?.forecast?.forecastday?[0].hour?.length ?? 0;
  }

  /// get Hourly items data
  static ({String temp, String icon, bool isCurrent, String time})
  getHourlyData(weatherModel, int index, DateTime now) {
    /// Get Hourly data
    final hourlyData = weatherModel?.forecast?.forecastday?[0].hour?[index];

    /// Get hours
    final apiHour = hourlyData?.time?.hour ?? 0;

    /// Match api and local device hours
    final isCurrent = (apiHour == now.hour);

    /// Get minutes
    final minute = "${isCurrent ? now.minute : 0}".padLeft(2, '0');
    final istHour = apiHour == 0 ? 0 : (apiHour % 12 == 0 ? 12 : apiHour % 12);
    final hour = istHour.toString().padLeft(2, '0');
    return (
      temp: hourlyData?.tempC?.toStringAsFixed(0) ?? "--",
      icon: hourlyData?.condition?.icon ?? '',
      isCurrent: isCurrent,
      time: "$hour:$minute",
    );
  }
}