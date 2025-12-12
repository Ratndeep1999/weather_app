import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
