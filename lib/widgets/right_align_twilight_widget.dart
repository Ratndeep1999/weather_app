import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../commons/text_styles.dart';

class RightAlignTwilightWidget extends StatelessWidget {
  const RightAlignTwilightWidget({
    super.key,
    required this.width,
    required this.height,
    required this.label,
    required this.icon,
    required this.actionTime,
  });

  final String label;
  final String icon;
  final String actionTime;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            /// Label
            Text(label, style: TextStyles.alegreyaSansBold),
            SizedBox(width: width * 0.01),

            /// Icon
            SvgPicture.asset(
              icon,
              height: height * 0.04, // 40
              width: width * 0.2, // 40
            ),
          ],
        ),

        /// Action Timing
        Text(actionTime, style: TextStyles.alegreyaSansBold),
      ],
    );
  }
}
