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
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
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
              SearchLocationWidget(
                searchController: searchController,
                isNight: widget.isNight,
              ),
              SizedBox(height: 30),

              /// Select Current Location
              InkWell(
                onTap: () => debugPrint("Current Location got"),
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

/// Refactored Search Location Widget
class SearchLocationWidget extends StatelessWidget {
  const SearchLocationWidget({
    super.key,
    required this.searchController,
    required this.isNight,
  });

  final TextEditingController searchController;
  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint("Search Location got"),
      child: TextField(
        controller: searchController,
        keyboardType: TextInputType.text,
        style: TextStyles.alegreyaSansBold,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          hint: Text("Search Location", style: TextStyles.alegreyaSansBold),
          filled: true,
          fillColor: isNight ? Color(0xFF0c3a8a) : Color(0xFF278dc4),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          isDense: false,
        ),
      ),
    );
  }
}

// Refactored Current Location Widget
