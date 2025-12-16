import 'package:flutter/material.dart';
import 'package:weather_app/widgets/two_items_widget.dart';
import '../commons/text_styles.dart';

class TodayHourlyForecastFirstRowWidget extends StatelessWidget {
  const TodayHourlyForecastFirstRowWidget({super.key, required this.today});

  final DateTime today;

  /// Method to formated date
  _getTodayFormatedDate() {
    final month = _getMonth(today.month);
    final date = today.day;
    final currentFormatedDate = "$month,${date.toString().padLeft(2, '0')}";
    return currentFormatedDate;
  }

  /// Method to get current month
  String _getMonth(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TwoItemsWidget(
      firstWidget: Text(
        "Today",
        style: TextStyles.sfProBold.copyWith(fontSize: 20),
      ),
      secondWidget: Text(
        _getTodayFormatedDate(),
        style: TextStyles.sfProRegular.copyWith(fontSize: 18),
      ),
    );
  }
}
