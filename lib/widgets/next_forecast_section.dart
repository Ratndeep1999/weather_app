import 'package:flutter/material.dart';
import 'background_decorated_box_widget.dart';
import 'next_forecast_first_row_widget.dart';
import 'next_seven_days_forecast_widget.dart';

class NextForecastSection extends StatelessWidget {
  const NextForecastSection({
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
      isNight: isNight,
      horizontalPadding: width * 0.04, //16
      verticalPadding: height * 0.02, //16
      customWidget: Column(
        children: [
          /// First Row
          NextForecastFirstRowWidget(),
          SizedBox(height: 20),

          /// Next Seven Day's Forecast
          NextSevenDaysForecastWidget(
            height: height,
            width: width,
            forecastDay: "Monday",
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "10",
            maxTemperature: "13",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            height: height,
            width: width,
            forecastDay: "Tuesday",
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "15",
            maxTemperature: "12",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            height: height,
            width: width,
            forecastDay: "Wednesday",
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "10",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            height: height,
            width: width,
            forecastDay: "Thursday",
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "10",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            height: height,
            width: width,
            forecastDay: "Friday",
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "10",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            height: height,
            width: width,
            forecastDay: "Saturday",
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "10",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            height: height,
            width: width,
            forecastDay: "Sunday",
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "12",
          ),
        ],
      ),
    );
  }
}
