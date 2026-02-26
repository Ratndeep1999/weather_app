import 'package:flutter/material.dart';
import 'package:weather_app/commons/text_styles.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required this.isNight,
    required this.onTap,
  });

  final VoidCallback onTap;
  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isNight ? Color(0xFF0c3a8a) : Color(0xFF278dc4),
          ),
        ),
        child: Text("Submit", style: TextStyles.alegreyaSansBold),
      ),
    );
  }
}
