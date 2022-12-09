import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/UI/utilis/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.weatherData}) : super(key: key);
  final WeatherData weatherData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/rain.jpg',
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              child: const Icon(
                FontAwesomeIcons.cloud,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                '12°',
                style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
