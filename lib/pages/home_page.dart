import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_gradient_background.dart';
import '../widgets/current_temperature_section.dart';
import '../widgets/current_weather_activity_section.dart';
import '../widgets/location_and_notif_section.dart';
import '../widgets/next_forecast_section.dart';
import '../widgets/today_hourly_forecast_section.dart';
import '../widgets/weather_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double get width => MediaQuery.of(context).size.width;

  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(_) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20, //32
            vertical: 20, //32
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Location and Notification Section
                LocationAndNotifSection(width: width, height: height),
                SizedBox(height: height * 0.0625), //50
                /// Weather Icon
                WeatherIcon(height: height, width: width),
                SizedBox(height: height * 0.025), // 20
                /// Current Temperature Section
                CurrentTemperatureSection(),
                SizedBox(height: height * 0.05), //40
                /// Current Weather Activity Section
                CurrentWeatherActivitySection(width: width, height: height),
                SizedBox(height: height * 0.025), //20
                /// Today's Hourly Forecast Section
                TodayHourlyForecastSection(width: width, height: height),
                SizedBox(height: height * 0.025), //20

                /// Next Forecast  Section
                NextForecastSection(width: width, height: height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

