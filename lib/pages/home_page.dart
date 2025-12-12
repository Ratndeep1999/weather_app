import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/widgets/app_gradient_background.dart';
import '../widgets/current_temperature_section.dart';
import '../widgets/current_weather_activity_section.dart';
import '../widgets/location_and_notif_section.dart';
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
            horizontal: width * 0.04, //16
            vertical: height * 0.02, //16
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Location and Notification Section
                LocationAndNotifSection(width: width, height: height),
                SizedBox(height: height * 0.0625),

                /// Weather Icon
                WeatherIcon(height: height, width: width),
                SizedBox(height: height * 0.025),

                /// Current Temperature Section
                CurrentTemperatureSection(),
                SizedBox(height: height * 0.05),

                /// Current Weather Activity Section
                CurrentWeatherActivitySection(width: width, height: height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
