import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherModel.dart';
import '../commons/text_styles.dart';

class CurrentTemperatureSection extends StatelessWidget {
  const CurrentTemperatureSection({super.key, this.weatherModel});

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    final String currentTepmC = weatherModel?.current?.tempC != null
        ? "${weatherModel?.current?.tempC?.toStringAsFixed(0)}°"
        : "--";
    final String? max =
        weatherModel?.forecast?.forecastday?[0].day?.maxtempC?.toStringAsFixed(
          0,
        ) ??
        "--";
    final String? min =
        weatherModel?.forecast?.forecastday?[0].day?.mintempC?.toStringAsFixed(
          0,
        ) ??
        "--";

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        /// Current Temperature
        text: currentTepmC,
        style: TextStyles.sfProSemibold.copyWith(fontSize: 80.0),
        semanticsLabel: "Temperature",
        children: [
          TextSpan(text: "\nPrecipitations\n", style: TextStyles.sfProRegular),

          /// Min and Max Temperature
          TextSpan(
            text: "Max.: $max°   Min.: $min°",
            style: TextStyles.sfProRegular,
          ),
        ],
      ),
    );
  }
}
