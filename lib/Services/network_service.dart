import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  static const String baseUrl = "http://api.weatherapi.com/v1/";
  static const String apiKey = "301f8508689e4070acd160811262702";

  ///
  Future<void> getForecastData({
    required double lat,
    required double long,
    int days = 7,
  }) async {
    final url = Uri.parse(
      "${baseUrl}forecast.json?key=$apiKey&q=$lat,$long &days=$days&aqi=no&alerts=no",
    );
    final response = await http.get(url);
    debugPrint(response.toString());
  }
}
