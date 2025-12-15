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
    required this.today,
  });

  final bool isNight;
  final double width;
  final double height;
  final DateTime today;

  /// Return Weekday in String Format
  String _formatedWeekdays(int addedDay) {
    final weekday = today.add(Duration(days: addedDay)).weekday;
    return _getWeekday(weekday);
  }

  /// Get the Weekday
  _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return ' ';
    }
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
          NextForecastFirstRowWidget(),
          SizedBox(height: 20),

          /// Next Seven Day's Forecast
          NextSevenDaysForecastWidget(
            isNight: isNight,
            height: height,
            width: width,
            forecastDay: _formatedWeekdays(0),
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "10",
            maxTemperature: "13",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            isNight: isNight,
            height: height,
            width: width,
            forecastDay: _formatedWeekdays(1),
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "15",
            maxTemperature: "12",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            isNight: isNight,
            height: height,
            width: width,
            forecastDay: _formatedWeekdays(2),
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "10",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            isNight: isNight,
            height: height,
            width: width,
            forecastDay: _formatedWeekdays(3),
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "10",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            isNight: isNight,
            height: height,
            width: width,
            forecastDay: _formatedWeekdays(4),
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "10",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            isNight: isNight,
            height: height,
            width: width,
            forecastDay: _formatedWeekdays(5),
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "10",
          ),
          SizedBox(height: 20),
          NextSevenDaysForecastWidget(
            isNight: isNight,
            height: height,
            width: width,
            forecastDay: _formatedWeekdays(6),
            weatherIcon: "assets/icons/sun_cloud.svg",
            minTemperature: "13",
            maxTemperature: "12",
          ),
        ],
      ),
    );
  }
}
