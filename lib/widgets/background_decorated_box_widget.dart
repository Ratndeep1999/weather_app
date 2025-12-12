import 'package:flutter/material.dart';

class BackgroundDecoratedBoxWidget extends StatelessWidget {
  const BackgroundDecoratedBoxWidget({
    super.key,
    required this.customWidget,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.backgroundColor
  });

  final Widget customWidget;
  final double horizontalPadding;
  final double verticalPadding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          /// Custom Widget
          child: customWidget,
        ),
      ),
    );
  }
}
