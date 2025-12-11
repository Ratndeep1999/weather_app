import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_gradient_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(_) {
    return Scaffold(body: AppGradientBackground(child: Column(
      children: [

      ],
    )));
  }
}
