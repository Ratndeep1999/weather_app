import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../commons/text_styles.dart';

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
