import 'package:flutter/material.dart';
import '../commons/text_styles.dart';

class CurrentTemperatureSection extends StatelessWidget {
  const CurrentTemperatureSection({super.key, required this.isNight});

  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: isNight ? " 28°\n" : " 30°\n",
        style: TextStyles.sfProSemibold.copyWith(fontSize: 80.0),
        semanticsLabel: "Temperature",
        children: [
          TextSpan(text: "Precipitations\n", style: TextStyles.sfProRegular),
          TextSpan(
            text: isNight ? "Max.: 31°   Min.: 25°" : "Max.: 34°   Min.: 28°",
            style: TextStyles.sfProRegular,
          ),
        ],
      ),
    );
  }
}
