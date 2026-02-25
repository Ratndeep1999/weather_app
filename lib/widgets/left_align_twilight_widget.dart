import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/commons/text_styles.dart';

class LeftAlignTwilightWidget extends StatelessWidget {
  const LeftAlignTwilightWidget({
    super.key,
    required this.height,
    required this.width,
    required this.icon,
    required this.label,
    required this.actionTime,
  });

  final String icon;
  final String label;
  final String actionTime;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            /// Icon
            SvgPicture.asset(
              icon,
              height: height * 0.04, // 32
              width: width * 0.2, // 40
            ),
            SizedBox(width: width * 0.01),

            /// Label
            Text(label, style: TextStyles.alegreyaSansBold),
          ],
        ),

        /// Action Timing
        Text(actionTime, style: TextStyles.alegreyaSansBold),
      ],
    );
  }
}
