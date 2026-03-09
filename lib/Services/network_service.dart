import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Services/connectivity_service.dart';
import 'package:weather_app/models/weatherModel.dart';

class NetworkService {
  static const String baseUrl = "http://api.weatherapi.com/v1/";
  static const String apiKey = "301f8508689e4070acd160811262702";

  /// Object of ConnectivityService class
  final ConnectivityService _connectionService = ConnectivityService();

  /// Check Internet connection
  Future<bool> _checkInternetConnection() async {
    final hasConnection = await _connectionService.checkInternetConnectivity();
    if (!hasConnection) {
      return false;
    }
    return true;
  }

  /// Hit api and return data
  Future<WeatherModel?> getForecastData({
    required String q,
    int days = 7,
  }) async {
    /// Check has-internet connection
    if (await _checkInternetConnection()) {
      /// String to "Uri"
      final Uri url = Uri.parse(
        "${baseUrl}forecast.json?key=$apiKey&q=$q&days=$days&aqi=no&alerts=no",
      );

      /// Get jsonResponse from server (String)
      final jsonResponse = await http.get(url);

      /// Convert jsonResponse (String) to mapResponse (Map <String, dynamic>)
      final mapResponse = jsonDecode(jsonResponse.body);

      /// Assign values to WeatherModel class variables using fromJson() factory constructor
      final WeatherModel weatherResponse = WeatherModel.fromJson(mapResponse);
      return weatherResponse;
    } else {
      /// Custom Error
      return WeatherModel(
        error: Error(code: 404, message: "Internet connectivity not available"),
      );
    }
  }
}
