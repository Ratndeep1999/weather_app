import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../commons/text_styles.dart';

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
