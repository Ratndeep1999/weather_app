import 'package:flutter/material.dart';

class TwoItemsWidget extends StatelessWidget {
  const TwoItemsWidget({
    super.key,
    required this.firstWidget,
    required this.secondWidget,
  });

  final Widget firstWidget;
  final Widget secondWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [firstWidget, secondWidget],
    );
  }
}
