import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/widgets/two_items_widget.dart';

class NextForecastFirstRowWidget extends StatelessWidget {
  const NextForecastFirstRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TwoItemsWidget(
      firstWidget: const Text(
        "Next Forecast",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      secondWidget: SvgPicture.asset("assets/icons/calendar.svg"),
    );
  }
}
