import 'package:flutter/material.dart';

class BackgroundDecoratedBoxWidget extends StatelessWidget {
  const BackgroundDecoratedBoxWidget({
    super.key,
    required this.customWidget,
    required this.horizontalPadding,
    required this.verticalPadding,
    this.backgroundColor,
    required this.isBorder,
    this.boxWidth,
  });

  final Widget customWidget;
  final double horizontalPadding;
  final double verticalPadding;
  final Color? backgroundColor;
  final bool isBorder;
  final double? boxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth ?? double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xFF0c3a8a),
          borderRadius: BorderRadius.circular(20),
          border: isBorder ? Border.all(color: Color(0xFF185dc4), width: 1.5) : null,
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
