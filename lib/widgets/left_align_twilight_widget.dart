import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../commons/text_styles.dart';

class LeftAlignTwilightWidget extends StatelessWidget {
  const LeftAlignTwilightWidget({
    super.key,
    required this.height,
    required this.width,
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon,
              height: height * 0.04, // 40
              width: width * 0.2, // 40
            ),
            SizedBox(width: width * 0.01),
            Text(label, style: TextStyles.alegreyaSansBold),
          ],
        ),
        // Timing
        Text("06 am", style: TextStyles.alegreyaSansBold),
      ],
    );
  }
}
