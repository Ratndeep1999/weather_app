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
    final hours = weatherModel?.forecast?.forecastday?[0].hour;
    final hoursLength = hours == null ? 24 : hours.length;

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

                /// Get hours from api (HH)
                final apiHur = hour?.time?.hour == null
                    ? "00"
                    : hour!.time!.hour.toString().padLeft(2, '0');

                /// Get hours from local device (HH)
                final localHur = today.hour.toString().padLeft(2, '0');

                /// Check local and api Hur isSame
                final bool isSame = (apiHur == localHur);

                /// Get minutes from local device (MM)
                final localMin = isSame
                    ? today.minute.toString().padLeft(2, '0')
                    : "00";

                /// Hourly Weather Report Item
                return HourlyWeatherReportWidget(
                  isNight: isNight,
                  width: width,
                  height: height,
                  temperature: temp,
                  icon: icon,
                  isCurrentHours: false,
                  hours: "$apiHur:$localMin",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
