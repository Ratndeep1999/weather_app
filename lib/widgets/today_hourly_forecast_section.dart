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
    this.weatherModel,
  });

  final WeatherModel? weatherModel;
  final bool isNight;
  final double width;
  final double height;
  final DateTime today;

  /// Method to get Formated hours
  _getHours(int hours) {
    final timeData = today.add(Duration(hours: hours));
    return timeData.hour.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
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
              itemCount: weatherModel?.forecast?.forecastday?[0].hour?.length,
              itemBuilder: (BuildContext context, int index) {
                /// Hourly Weather Report Item
                return HourlyWeatherReportWidget(
                  isNight: isNight,
                  width: width,
                  height: height,
                  temperature: weatherModel?.forecast?.forecastday?[0].hour?[0].tempC?.toStringAsFixed(0) ?? "--",
                  icon: "assets/icons/sunny_cloud.svg",
                  hours: _getHours(-1),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
