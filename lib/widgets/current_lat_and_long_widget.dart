import 'package:flutter/material.dart';
import 'package:weather_app/commons/text_styles.dart';
import 'background_decorated_box_widget.dart';

class CurrentLatAndLongWidget extends StatelessWidget {
  const CurrentLatAndLongWidget({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
  });

  final bool isNight;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoratedBoxWidget(
      isNight: isNight,
      horizontalPadding: width * 0.05,
      verticalPadding: height * 0.0125,
      customWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Latitude
          Text("Latitude : 0.0", style: TextStyles.alegreyaSansBold),

          /// Longitude
          Text("Longitude : 0.0", style: TextStyles.alegreyaSansBold),
        ],
      ),
    );
  }
}
