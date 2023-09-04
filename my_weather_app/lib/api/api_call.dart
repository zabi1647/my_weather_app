import 'dart:convert';

import 'package:my_weather_app/api/forecaste.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<Forecaste> getApiForecaste() async {
    final response = await http.get(Uri.parse(
        "http://dataservice.accuweather.com/forecasts/v1/daily/5day/258278?apikey=zlzLQllBo7LlGJJimvY5RnkJXRcQfGMn"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Forecaste.fromJson(data);
    } else {
      throw Exception(toString());
    }
  }
}
