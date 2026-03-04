import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/widgets/right_align_twilight_widget.dart';
import 'background_decorated_box_widget.dart';
import 'left_align_twilight_widget.dart';

class TodayTwilightSection extends StatelessWidget {
  const TodayTwilightSection({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
    required this.weatherModel,
  });

  final WeatherModel? weatherModel;
  final bool isNight;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    /// Get Forecast Day Twilight
    final Astro? astro = weatherModel?.forecast?.forecastday?[0].astro;
    final sunrise = astro?.sunrise ?? "-- AM";
    final sunset = astro?.sunset ?? "-- PM";
    final moonrise = astro?.moonrise ?? "-- PM";
    final moonset = astro?.moonset ?? "-- AM";

    return BackgroundDecoratedBoxWidget(
      isNight: isNight,
      horizontalPadding: width * 0.05,
      verticalPadding: height * 0.0125,
      customWidget: Column(
        children: [
          /// Upper Section
          Row(
            children: [
              /// Sunrise
              LeftAlignTwilightWidget(
                height: height,
                width: width,
                icon: "assets/icons/sunrise.svg",
                label: "Sunrise",
                actionTime: sunrise,
              ),
              Spacer(),

              /// Sunset
              RightAlignTwilightWidget(
                width: width,
                height: height,
                label: "Sunset",
                icon: "assets/icons/sunset.svg",
                actionTime: sunset,
              ),
            ],
          ),
          SizedBox(height: height * 0.025), // 20
          /// Bottom Section
          Row(
            children: [
              /// Moonrise
              LeftAlignTwilightWidget(
                height: height,
                width: width,
                icon: "assets/icons/moonrise.svg",
                label: "Moonrise",
                actionTime: moonrise,
              ),
              Spacer(),

              /// Moonset
              RightAlignTwilightWidget(
                width: width,
                height: height,
                label: "Moonset",
                icon: "assets/icons/moonset.svg",
                actionTime: moonset,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
