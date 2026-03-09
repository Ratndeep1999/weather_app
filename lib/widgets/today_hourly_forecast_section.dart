import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/utils/hourly_data_utils.dart';
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
    final DateTime now = DateTime.now();

    return BackgroundDecoratedBoxWidget(
      isNight: isNight,
      horizontalPadding: width * 0.04, //16
      verticalPadding: height * 0.02, //16
      customWidget: Column(
        children: [
          /// First Row
          TodayHourlyForecastFirstRowWidget(today: now),
          SizedBox(height: height * 0.02), //16
          /// Hourly Weather Report
          SizedBox(
            height: height * 0.2125,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: HourlyDataUtils.getHourlyItemLength(weatherModel),
              separatorBuilder: (_, index) => SizedBox(width: width * 0.032),
              itemBuilder: (BuildContext context, int index) {
                /// Get Specific Hour Item Data
                final data = HourlyDataUtils.getHourlyData(weatherModel, index);

                /// Hourly Weather Report Item
                return HourlyWeatherReportWidget(
                  isNight: isNight,
                  width: width,
                  height: height,
                  temperature: data.temp,
                  icon: data.icon,
                  isCurrentHours: data.isCurrent,
                  hours: data.time,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
