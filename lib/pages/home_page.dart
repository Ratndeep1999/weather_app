import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/pages/location_page.dart';
import 'package:weather_app/widgets/app_gradient_background.dart';
import '../widgets/current_temperature_section.dart';
import '../widgets/current_weather_activity_section.dart';
import '../widgets/location_and_notif_section.dart';
import '../widgets/next_forecast_section.dart';
import '../widgets/today_hourly_forecast_section.dart';
import '../widgets/today_twilight_section.dart';
import '../widgets/weather_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.nowDT, required this.isNight});

  final bool isNight;
  final DateTime nowDT;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  WeatherModel? weatherModel;
  late final bool isNight;

  double get width => MediaQuery.of(context).size.width;

  double get height => MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();
    isNight = widget.isNight;
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
                LocationAndNotifSection(
                  width: width,
                  height: height,
                  selectLocationTap: _selectLocationPage,
                  location: weatherModel?.location?.name != null
                      ? "${weatherModel!.location!.name},"
                      : 'Select Location',
                  region: weatherModel?.location?.region ?? '',
                ),
                SizedBox(height: height * 0.0625), //50
                /// Weather Icon
                WeatherIcon(
                  iconSize: height * 0.2,
                  icon: weatherModel?.current?.condition?.icon ?? '',
                ),
                SizedBox(height: height * 0.025), // 20
                /// Current Temperature Section
                CurrentTemperatureSection(weatherModel: weatherModel),
                SizedBox(height: height * 0.05), //40
                /// Current Weather Activity Section
                CurrentWeatherActivitySection(
                  isNight: isNight,
                  width: width,
                  height: height,
                  weatherModel: weatherModel,
                ),
                SizedBox(height: height * 0.025), //20
                /// Twilight Section
                TodayTwilightSection(
                  isNight: isNight,
                  width: width,
                  height: height,
                  weatherModel: weatherModel,
                ),
                SizedBox(height: height * 0.025), //20
                /// Today's Hourly Forecast Section
                TodayHourlyForecastSection(
                  isNight: isNight,
                  width: width,
                  height: height,
                  today: widget.nowDT,
                  weatherModel: weatherModel,
                ),
                SizedBox(height: height * 0.025), //20
                /// Next Forecast  Section
                NextForecastSection(
                  isNight: isNight,
                  width: width,
                  height: height,
                  today: widget.nowDT,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigate Location Page
  Future<void> _selectLocationPage() async {
    weatherModel = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            LocationPage(isNight: isNight, width: width, height: height),
      ),
    );
    if (weatherModel != null) {
      setState(() {});
    }
  }
}
