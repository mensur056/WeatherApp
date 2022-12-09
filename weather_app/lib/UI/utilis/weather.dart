import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/UI/utilis/location.dart';

const apiKeys = '7e63f47e0d470cabc36d6ca78e2fee10';

class WeatherData {
  LocationHelper locationData;
  double? currentTemperature;
  // late int currentCondition;
  WeatherData({required this.locationData});
  Future<void> getCurrentTemperature() async {
    Response response = await get(
      Uri.http(
        'api.openweathermap.org',
        '/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=$apiKeys&unit=metric',
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      print(response.body);
      var currentWeather = jsonDecode(data);
      try {
        currentTemperature = currentWeather["main"]["temp"];
        // currentCondition = currentWeather['weather']['']['id'];
      } catch (e) {
        print(e);
      }
    } else {
      print('Dont come from your API');
    }
  }
}
