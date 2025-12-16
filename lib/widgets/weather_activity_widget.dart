import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../commons/text_styles.dart';

class WeatherActivityWidget extends StatelessWidget {
  const WeatherActivityWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        Text(label, style: TextStyles.sfProBold),
      ],
    );
  }
}
