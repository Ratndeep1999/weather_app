import 'package:flutter/material.dart';

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
          Row(children: [Text("Sunrise")]),
          Row(children: [Text("Moonrise")]),
        ],
      ),
      horizontalPadding: width * 0.05,
      verticalPadding: height * 0.0125,
    );
  }
}