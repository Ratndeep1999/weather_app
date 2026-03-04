import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherModel.dart';
import '../commons/text_styles.dart';

class CurrentTemperatureSection extends StatelessWidget {
  const CurrentTemperatureSection({super.key, this.weatherModel});

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    /// Get Current Temperature
    final double? temp = weatherModel?.current?.tempC;
    final String currTemp = temp != null ? "${temp.toStringAsFixed(0)}°" : "--";

    /// Get Today Temperature's
    final Day? todayTemp = weatherModel?.forecast?.forecastday?[0].day;
    final String maxTemp = todayTemp?.maxtempC?.toStringAsFixed(0) ?? "--";
    final String minTemp = todayTemp?.mintempC?.toStringAsFixed(0) ?? "--";

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        /// Current Temperature
        text: currTemp,
        style: TextStyles.sfProSemibold.copyWith(fontSize: 80.0),
        semanticsLabel: "Temperature",
        children: [
          TextSpan(text: "\nPrecipitations\n", style: TextStyles.sfProRegular),

          /// Forecast Day Min and Max Temperature
          TextSpan(
            text: "Max.: $maxTemp°   Min.: $minTemp°",
            style: TextStyles.sfProRegular,
          ),
        ],
      ),
    );
  }
}
