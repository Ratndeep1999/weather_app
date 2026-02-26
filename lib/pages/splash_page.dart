import 'package:flutter/material.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final DateTime nowDT = DateTime.now();

  @override
  void initState() {
    _getDayOrNight();
    _goToNextPage();
    super.initState();
  }

  /// navigate to next screen
  _goToNextPage() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(nowDT: nowDT, isNight: _getDayOrNight()),
        ),
      );
    });
  }

  /// Method to get Night or Not
  _getDayOrNight() {
    final bool isNight = nowDT.hour > 18 || nowDT.hour < 6;
    return isNight;
  }

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      body: BackgroundDecoratedBoxWidget(
        isNight: _getDayOrNight(),
        horizontalPadding: 16,
        verticalPadding: 16,
        customWidget: Center(child: Text("Weather Forcest App")),
      ),
    );
  }
}
