import 'package:flutter/material.dart';
import 'package:weather_app/commons/text_styles.dart';
import 'package:weather_app/widgets/app_gradient_background.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({
    super.key,
    required this.isNight,
    required this.width,
    required this.height,
  });

  final bool isNight;
  final double width;
  final double height;

  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  late double width, height;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = widget.width;
    height = widget.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        isNight: widget.isNight,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, //20
            vertical: height * 0.025, //20
          ),
          child: Column(
            children: [
              /// Location Search Bar
              /// Select Current Location
              InkWell(
                onTap: ()=> debugPrint("Current Location got"),
                child: BackgroundDecoratedBoxWidget(
                  isNight: widget.isNight,
                  horizontalPadding: width * 0.05,
                  verticalPadding: height * 0.0125,
                  customWidget: Row(
                    children: [
                      /// Icon
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 20),

                      /// Text
                      Text(
                        "Current Location",
                        style: TextStyles.alegreyaSansBold,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),

              /// Current Location Lat and Long.
              BackgroundDecoratedBoxWidget(
                isNight: widget.isNight,
                horizontalPadding: width * 0.05,
                verticalPadding: height * 0.0125,
                customWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Latitude
                    Text("Latitude : 0.0", style: TextStyles.alegreyaSansBold),

                    /// Longitude
                    Text("Longitude : 0.0", style: TextStyles.alegreyaSansBold),
                  ],
                ),
              ),

              Spacer(),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      widget.isNight ? Color(0xFF0c3a8a) : Color(0xFF278dc4),
                    ),
                  ),
                  child: Text("Submit", style: TextStyles.alegreyaSansBold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
