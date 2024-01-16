import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_provider.dart';
import 'package:weather_app/services/weather_app_client.dart';
import 'package:weather_app/views/Additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  WeatherApiClient client = WeatherApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 240, 240),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Consumer<WeatherProvider>(builder: (context, pro, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onFieldSubmitted: (String location) {
                      pro.getData(location);
                    },
                    textInputAction: TextInputAction.done,
                    controller: pro.searchController,
                    decoration: InputDecoration(
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
                                icon: const Icon(Icons.cancel),
                              )
                            : null),
                  ),
                ),
                if (pro.data != null)
                  currentWeather(
                    "${pro.data!.temp!}",
                    pro.searchController.text.isEmpty
                        ? "Calicut"
                        : pro.searchController.text,
                  ),
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
