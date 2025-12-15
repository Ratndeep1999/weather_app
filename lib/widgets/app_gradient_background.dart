import 'package:flutter/material.dart';

class AppGradientBackground extends StatelessWidget {
  const AppGradientBackground({
    super.key,
    required this.child,
    required this.isNight,
  });

  final bool isNight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isNight
                ? const [Color(0xFF08244F), Color(0xFF134CB5), Color(0xFF0B42AB)]
                : const [Color(0xFF29B2DD), Color(0xFF33AADD), Color(0xFF2DC8EA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}
