import 'package:flutter/material.dart';
import 'package:weather_app/commons/text_styles.dart';
import 'background_decorated_box_widget.dart';

class GetLocationWidget extends StatelessWidget {
  const GetLocationWidget({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
    required this.onTap,
    required this.icon,
    required this.label,
    this.isLoading = false,
    this.isLoadingFeature = false,
  });

  final VoidCallback onTap;
  final bool isNight, isLoading, isLoadingFeature;
  final double height, width;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BackgroundDecoratedBoxWidget(
        isNight: isNight,
        horizontalPadding: width * 0.05,
        verticalPadding: height * 0.0125,
        customWidget: Row(
          children: [
            /// Icon
            isLoadingFeature
                ? isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Icon(icon, color: Colors.white)
                : Icon(icon, color: Colors.white),
            SizedBox(width: width * 0.045), // 18
            /// Text
            Text(label, style: TextStyles.alegreyaSansBold),
          ],
        ),
      ),
    );
  }
}
