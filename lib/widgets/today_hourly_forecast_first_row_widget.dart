import 'package:flutter/material.dart';
import 'package:weather_app/widgets/two_items_widget.dart';

class TodayHourlyForecastFirstRowWidget extends StatelessWidget {
  const TodayHourlyForecastFirstRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TwoItemsWidget(
      firstWidget: Text(
        "Today",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      secondWidget: Text(
        "Mar, 9",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}