import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
TextStyle infoFont = const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

Widget additionalInformation(
  String wind,
  String humidity,
  String pressure,
  String feel_like,
) {
  return SizedBox(
    height: 220,
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Widn",
                    style: titleFont,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Pressure",
                    style: titleFont,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wind,
                    style: infoFont,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    pressure,
                    style: infoFont,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Humidity",
                    style: titleFont,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Feels Like",
                    style: titleFont,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    humidity,
                    style: infoFont,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    feel_like,
                    style: infoFont,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
