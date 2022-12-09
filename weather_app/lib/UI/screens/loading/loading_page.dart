import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/UI/screens/home/home_page.dart';
import 'package:weather_app/UI/utilis/location.dart';
import 'package:weather_app/UI/utilis/weather.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  LocationHelper? locationData;

  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData?.getCurrentLocation();
    if (locationData?.latitude == null || locationData?.longitude == null) {
      print('There is not latitude and longitude');
    } else {
      print('latitude:${locationData?.latitude}');
      print('longitude:${locationData?.longitude}');
    }
  }

  void getWeatherData() async {
    await getLocationData();
    WeatherData weatherData = WeatherData(
      locationData: locationData!,
    );
    await weatherData.getCurrentTemperature();
    if (weatherData.currentTemperature == null) {
      print('it is empty');
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        weatherData: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.purple, Colors.blue])),
        child: const Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            duration: Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
