import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherApiService {
  final String apiKey = 'cb319ef89b03463e85580531240310';
  final String baseUrl = 'https://api.weatherapi.com/v1/forecast.json';

  Future<Weather> fetchWeather(String location) async {
    final response = await http
        .get(Uri.parse('$baseUrl?key=$apiKey&q=$location&days=4&aqi=yes'));
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
