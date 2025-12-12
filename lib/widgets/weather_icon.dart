import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/sun_cloud.svg",
      height: height * 0.225,
      width: width * 0.45,
      semanticsLabel: "Sunny",
    );
  }
}