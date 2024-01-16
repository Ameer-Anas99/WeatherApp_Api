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
          style: const TextStyle(fontSize: 45, color: Colors.white),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "$location",
          style: const TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 60, 231, 66),
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    ),
  );
}
