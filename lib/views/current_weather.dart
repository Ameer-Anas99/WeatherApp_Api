import 'package:flutter/material.dart';

Widget currentWeather(String temp, String location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "$temp",
          style: const TextStyle(
            fontSize: 45,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "$location",
          style: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 90, 89, 89),
              fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}
