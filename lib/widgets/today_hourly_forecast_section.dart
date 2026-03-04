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

                /// Get Formatted 12-hour time (HH)
                final time = hour?.time;
                final api_hur = time == null
                    ? "00"
                    : (time.hour % 12 == 0 ? 12 : time.hour % 12)
                          .toString()
                          .padLeft(2, '0');

                /// Get Formatted Minutes
                final form_hur = (today.hour % 12 == 0 ? 12 : today.hour % 12);
                final local_hur = form_hur.toString().padLeft(2, '0');
                final bool isHurSame = (api_hur == local_hur);
                final form_min = isHurSame
                    ? today.minute.toString().padLeft(2, '0')
                    : "00";

                /// Hourly Weather Report Item
                return HourlyWeatherReportWidget(
                  isNight: isNight,
                  width: width,
                  height: height,
                  temperature: temp,
                  icon: icon,
                  isCurrentHours: isHurSame,
                  hours: "$api_hur:$form_min",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
