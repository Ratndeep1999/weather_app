import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/widgets/two_items_widget.dart';

import '../commons/text_styles.dart';

class LocationAndNotifSection extends StatelessWidget {
  const LocationAndNotifSection({
    super.key,
    required this.width,
    required this.height,
    required this.selectLocationTap,
  });

  final VoidCallback selectLocationTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return TwoItemsWidget(
      firstWidget: InkWell(
        onTap: selectLocationTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/location.svg",
              semanticsLabel: "location",
            ),
            SizedBox(width: width * 0.02), //8
            Text("Fortaleza", style: TextStyles.sfProSemibold),
            SizedBox(width: width * 0.04), //16
            SvgPicture.asset(
              "assets/icons/down_arrow.svg",
              semanticsLabel: "select location",
            ),
          ],
        ),
      ),
      secondWidget: Stack(
        clipBehavior: Clip.none,
        children: [
          // no notify
          SvgPicture.asset(
            "assets/icons/no_notif.svg",
            semanticsLabel: "no notification",
          ),
          // no notify
          Visibility(
            visible: true,
            child: Positioned(
              left: width * 0.03, // 12
              bottom: height * 0.02, // 16
              child: SvgPicture.asset(
                "assets/icons/yes_notif.svg",
                semanticsLabel: "notification",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
