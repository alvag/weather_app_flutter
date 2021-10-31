import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    String apiKey = dotenv.get('WEATHER_API_KEY');
    var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
