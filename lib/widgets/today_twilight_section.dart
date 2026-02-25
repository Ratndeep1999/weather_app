import 'package:flutter/material.dart';
import 'package:weather_app/widgets/right_align_twilight_widget.dart';
import 'background_decorated_box_widget.dart';
import 'left_align_twilight_widget.dart';

class TodayTwilightSection extends StatelessWidget {
  const TodayTwilightSection({
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
      horizontalPadding: width * 0.05,
      verticalPadding: height * 0.0125,
      customWidget: Column(
        children: [
          Row(
            children: [
              /// Sunrise
              LeftAlignTwilightWidget(
                height: height,
                width: width,
                icon: "assets/icons/sunrise.svg",
                label: "Sunrise",
                actionTime: "06 am",
              ),
              Spacer(),

              /// Sunset
              RightAlignTwilightWidget(
                width: width,
                height: height,
                label: "Sunset",
                icon: "assets/icons/sunset.svg",
                actionTime: "06 pm",
              ),
            ],
          ),
          SizedBox(height: height * 0.025), // 20

          Row(
            children: [
              /// Moonrise
              LeftAlignTwilightWidget(
                height: height,
                width: width,
                icon: "assets/icons/moonrise.svg",
                label: "Moonrise",
                actionTime: "07 pm",
              ),
              Spacer(),

              /// Moonset
              RightAlignTwilightWidget(
                width: width,
                height: height,
                label: "Moonset",
                icon: "assets/icons/moonset.svg",
                actionTime: "05 am",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
