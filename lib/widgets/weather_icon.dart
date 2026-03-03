import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
    required this.height,
    required this.width,
    this.icon,
  });

  final String? icon;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return icon != null
        /// Weather status icon
        ? Image.network(
            "http:$icon",
            height: height * 0.225,
            width: width * 0.45,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              /// Server error status icon
              return Image.asset(
                "assets/icons/server_error.png",
                height: height * 0.225,
                width: width * 0.45,
              );
            },
          )
        /// Location error status if icon is null
        : Image.asset(
            "assets/icons/location_error.png",
            height: height * 0.225,
            width: width * 0.45,
          );

    // SvgPicture.asset(
    // "assets/icons/sun_cloud.svg",
    // height: height * 0.225,
    // width: width * 0.45,
    // semanticsLabel: "Sunny",
    // );
  }
}
