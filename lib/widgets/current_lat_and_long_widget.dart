import 'package:flutter/material.dart';
import 'package:weather_app/commons/text_styles.dart';
import 'background_decorated_box_widget.dart';

class CurrentLatAndLongWidget extends StatelessWidget {
  const CurrentLatAndLongWidget({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
    required double lat,
    required double long,
    required this.isLoading,
  }) : _lat = lat,
       _long = long;

  final bool isNight, isLoading;
  final double height, width, _lat, _long;

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
          buildLabel("Latitude : ", _lat),

          /// Longitude
          buildLabel("Longitude : ", _long),
        ],
      ),
    );
  }

  Widget buildLabel(String label, double value) => Row(
    children: [
      /// Label
      Text(label, style: TextStyles.alegreyaSansBold),
      isLoading
          ? const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                child: LinearProgressIndicator(),
              ),
            )
          /// Value
          : Text("$value", style: TextStyles.alegreyaSansBold),
    ],
  );
}
