import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../commons/text_styles.dart';
import 'background_decorated_box_widget.dart';

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
      customWidget: Column(
        children: [
          /// Sunrise and Sunset
          Row(
            children: [
              /// Left Side Widget
              LeftAlignTwilightWidget(height: height, width: width),
              Spacer(),

              /// Right Side Widget
              RightAlignTwilightWidget(width: width, height: height),
            ],
          ),

          /// Moonrise and Moonset
          // Row(children: [Text("Moonrise")]),
        ],
      ),
      horizontalPadding: width * 0.05,
      verticalPadding: height * 0.0125,
    );
  }
}

class RightAlignTwilightWidget extends StatelessWidget {
  const RightAlignTwilightWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Text then Icon
        Row(
          children: [
            Text("Sunset", style: TextStyles.alegreyaSansBold),
            SizedBox(width: width * 0.01),
            SvgPicture.asset(
              "assets/icons/sunset.svg",
              height: height * 0.04, // 40
              width: width * 0.2, // 40
            ),
          ],
        ),
        // Timing
        Text("06 pm", style: TextStyles.alegreyaSansBold),
      ],
    );
  }
}

class LeftAlignTwilightWidget extends StatelessWidget {
  const LeftAlignTwilightWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Icon then Text
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/sunrise.svg",
              height: height * 0.04, // 40
              width: width * 0.2, // 40
            ),
            SizedBox(width: width * 0.01),
            Text("Sunrise", style: TextStyles.alegreyaSansBold),
          ],
        ),
        // Timing
        Text("06 am", style: TextStyles.alegreyaSansBold),
      ],
    );
  }
}
