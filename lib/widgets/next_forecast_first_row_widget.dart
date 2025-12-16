import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/widgets/two_items_widget.dart';
import '../commons/text_styles.dart';

class NextForecastFirstRowWidget extends StatelessWidget {
  const NextForecastFirstRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TwoItemsWidget(
      firstWidget: Text(
        "Next Forecast",
        style: TextStyles.sfProBold.copyWith(fontSize: 20),
      ),
      secondWidget: SvgPicture.asset("assets/icons/calendar.svg"),
    );
  }
}
