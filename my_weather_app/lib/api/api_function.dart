import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_weather_app/api/forecaste.dart';
import 'package:my_weather_app/api/weather.dart';

class ApiFunction {
  Future<WeatherData> getApiCall() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=islamabad&appid=2b4041b3c32615147320951ee8cc3fb7"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WeatherData.fromJson(data);
    } else {
      throw Exception("Error...");
    }
  }

  Future<Forecaste> getApiForecaste() async {
    final response = await http.get(Uri.parse(
        "http://dataservice.accuweather.com/forecasts/v1/daily/5day/258278?apikey=zlzLQllBo7LlGJJimvY5RnkJXRcQfGMn"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Forecaste.fromJson(data);
    } else {
      throw Exception("Forecaste Api not connected..");
    }
  }
}
