import 'package:flutter/material.dart';
import 'background_decorated_box_widget.dart';
import 'next_forecast_first_row_widget.dart';
import 'next_seven_days_forecast_widget.dart';

class NextForecastSection extends StatelessWidget {
  const NextForecastSection({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoratedBoxWidget(
      horizontalPadding: width * 0.04, //16
      verticalPadding: height * 0.02, //16
      customWidget: Column(
        children: [
          /// First Row
          NextForecastFirstRowWidget(),
          SizedBox(height: 20),

          /// Next Seven Day's Forecast
          NextSevenDaysForecastWidget(height: height, width: width),
        ],
      ),
    );
  }
}
