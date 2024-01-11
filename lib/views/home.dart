import 'package:flutter/material.dart';
import 'package:weather_app/views/Additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentWeather(Icons.wb_sunny_rounded, "25.2", "Georgia"),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Additional Information",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          additionalInformation("24.1", "2", "1015", "25.4")
        ],
      ),
    );
  }
}
