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
        SizedBox(
          height: 10,
        ),
        Text(
          "$temp",
          style: TextStyle(
            fontSize: 45,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "$location",
          style: TextStyle(fontSize: 15, color: Colors.grey),
        )
      ],
    ),
  );
}
