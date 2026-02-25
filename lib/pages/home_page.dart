import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_gradient_background.dart';
import '../widgets/current_temperature_section.dart';
import '../widgets/current_weather_activity_section.dart';
import '../widgets/location_and_notif_section.dart';
import '../widgets/next_forecast_section.dart';
import '../widgets/today_hourly_forecast_section.dart';
import '../widgets/today_twilight_section.dart';
import '../widgets/weather_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final bool isNight;
  late final DateTime today;

  double get width => MediaQuery.of(context).size.width;

  double get height => MediaQuery.of(context).size.height;

  @override
  void initState() {
    _getDayOrNight();
    super.initState();
  }

  /// Method to get Night or Not
  _getDayOrNight() {
    today = DateTime.now();
    final currentHours = today.hour;
    debugPrint("Current Hours : $currentHours");
    isNight = currentHours > 18 || currentHours < 6;
    debugPrint("Is Night = $isNight");
  }

  @override
  Widget build(_) {
    return Scaffold(
      body: AppGradientBackground(
        isNight: isNight,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, //20
              vertical: height * 0.025, //20
            ),
            child: Column(
              children: [
                /// Location and Notification Section
                LocationAndNotifSection(width: width, height: height),
                SizedBox(height: height * 0.0625), //50
                /// Weather Icon
                WeatherIcon(height: height, width: width),
                SizedBox(height: height * 0.025), // 20
                /// Current Temperature Section
                CurrentTemperatureSection(isNight: isNight),
                SizedBox(height: height * 0.05), //40
                /// Current Weather Activity Section
                CurrentWeatherActivitySection(
                  isNight: isNight,
                  width: width,
                  height: height,
                ),
                SizedBox(height: height * 0.025), //20
                /// Twilight Section
                TodayTwilightSection(
                  isNight: isNight,
                  width: width,
                  height: height,
                ),
                SizedBox(height: height * 0.025), //20
                /// Today's Hourly Forecast Section
                TodayHourlyForecastSection(
                  isNight: isNight,
                  width: width,
                  height: height,
                  today: today,
                ),
                SizedBox(height: height * 0.025), //20
                /// Next Forecast  Section
                NextForecastSection(
                  isNight: isNight,
                  width: width,
                  height: height,
                  today: today,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
