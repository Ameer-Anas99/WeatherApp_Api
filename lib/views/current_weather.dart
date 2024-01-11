import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.purple,
          size: 65,
        ),
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
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        )
      ],
    ),
  );
}
