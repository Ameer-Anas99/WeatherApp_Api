// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/connectivity_provider.dart';
import 'package:weather_app/controller/weather_provider.dart';
import 'package:weather_app/services/weather_app_client.dart';
import 'package:weather_app/views/Additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  WeatherApiClient client = WeatherApiClient();

  @override
  Widget build(BuildContext context) {
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/download.png"), fit: BoxFit.fill)),
          child: Consumer<WeatherProvider>(builder: (context, pro, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    onFieldSubmitted: (String location) {
                      pro.getData(location);
                    },
                    textInputAction: TextInputAction.done,
                    controller: pro.searchController,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        isDense: true,
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: pro.searchController.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  pro.searchController.clear();
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.deepOrange,
                                ),
                              )
                            : null),
                  ),
                ),
                if (pro.data != null)
                  currentWeather(
                    "${pro.data!.temp!}",
                    pro.searchController.text.isEmpty
                        ? "Malappuram"
                        : pro.searchController.text,
                  ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                if (pro.data != null)
                  additionalInformation(
                    "${pro.data!.wind}",
                    "${pro.data!.humidity}",
                    "${pro.data!.pressure}",
                    "${pro.data!.feel_like}",
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
