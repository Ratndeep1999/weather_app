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
}
