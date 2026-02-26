import 'package:flutter/material.dart';
import 'package:weather_app/commons/text_styles.dart';
import 'background_decorated_box_widget.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
    required this.onTap,
  });

  final VoidCallback onTap;
  final bool isNight;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BackgroundDecoratedBoxWidget(
        isNight: isNight,
        horizontalPadding: width * 0.05,
        verticalPadding: height * 0.0125,
        customWidget: Row(
          children: [
            /// Icon
            Icon(Icons.location_on, color: Colors.white),
            SizedBox(width: width * 0.045), // 18

            /// Text
            Text("Current Location", style: TextStyles.alegreyaSansBold),
          ],
        ),
      ),
    );
  }
}
