import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherModel.dart';
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
    required this.weatherModel,
  });

  final WeatherModel? weatherModel;
  final bool isNight;
  final double width;
  final double height;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    /// Get WeekDays
    final weekday = weatherModel?.forecast?.forecastday;

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
          SizedBox(
            height: width * 0.86,
            child: ListView.separated(
              itemCount: weekday == null ? 7 : weekday.length,
              separatorBuilder: (_, index) => SizedBox(height: height * 0.025),
              itemBuilder: (_, index) {
                /// Get Maximum and Minimum Temperature
                final day = weekday?[index];
                final maxTemp = day?.day?.maxtempC?.toStringAsFixed(0) ?? "--";
                final minTemp = day?.day?.mintempC?.toStringAsFixed(0) ?? "--";
                final icon = weekday?[index].day?.condition?.icon ?? '';

                return NextSevenDaysForecastWidget(
                  isNight: isNight,
                  height: height,
                  width: width,
                  forecastDay: _formatedWeekdays(index),
                  icon: icon,
                  minTemperature: maxTemp,
                  maxTemperature: minTemp,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

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
}
