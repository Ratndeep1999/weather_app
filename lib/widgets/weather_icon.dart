import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key, this.icon, required this.iconSize});

  final String? icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return icon != null
        /// Weather status icon
        ? Image.network(
            "http:$icon",
            height: iconSize,
            width: iconSize,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              /// Server error status icon
              return Image.asset(
                "assets/icons/server_error.png",
                height: iconSize,
                width: iconSize,
                fit: BoxFit.fill,
              );
            },
          )
        /// Location error status if icon is null
        : Image.asset(
            "assets/icons/location_error.png",
            height: iconSize,
            width: iconSize,
            fit: BoxFit.fill,
          );
  }
}
