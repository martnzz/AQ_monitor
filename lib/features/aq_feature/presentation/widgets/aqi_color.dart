import 'package:flutter/material.dart';

Color? pollutionColor;
Color? pollutionTextColor;
String? pollutionText;

Color getPollutionColor(int index) {
  if (index > 0 && index <= 50) {
    return pollutionColor = Colors.lightGreenAccent;
  } else if (index > 50 && index <= 100) {
    return pollutionColor = Colors.yellow;
  } else if (index > 100 && index <= 150) {
    return pollutionColor = Colors.deepOrangeAccent;
  } else if (index > 150 && index <= 200) {
    return pollutionColor = Colors.red;
  } else if (index > 200 && index <= 250) {
    return pollutionColor = Colors.purple;
  } else if (index > 250 && index <= 300) {
    return pollutionColor = const Color.fromARGB(255, 158, 105, 123);
  }
  return pollutionColor = Colors.white;
}

Color getPollutionTextColor(int index) {
  if (index > 0 && index <= 50) {
    return pollutionTextColor = Colors.black;
  } else if (index > 50 && index <= 100) {
    return pollutionTextColor = Colors.black;
  } else if (index > 100 && index <= 150) {
    return pollutionTextColor = Colors.black;
  } else if (index > 150 && index <= 200) {
    return pollutionTextColor = Colors.white;
  } else if (index > 200 && index <= 250) {
    return pollutionTextColor = Colors.white;
  } else if (index > 250 && index <= 300) {
    return pollutionTextColor = Colors.white;
  }
  return pollutionTextColor = Colors.white;
}

String getPollutionText(int index) {
  if (index > 0 && index <= 50) {
    return "good";
  } else if (index > 50 && index <= 100) {
    return "moderate";
  } else if (index > 100 && index <= 150) {
    return "sensitive_gr";
  } else if (index > 150 && index <= 200) {
    return "unhealthy";
  } else if (index > 200 && index <= 250) {
    return "very_unhealthy";
  } else if (index > 250 && index <= 300) {
    return "hazardous";
  }
  return 'error';
}
