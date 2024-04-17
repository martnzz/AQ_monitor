import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LiveAqiIndexText extends StatelessWidget {
  final int index;
  const LiveAqiIndexText({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Color? color;
    Color? textColor;
    String? text;

    if (index > 0 && index <= 50) {
      color = Colors.lightGreenAccent;
      textColor = Colors.black;
      text = "good".tr();
    } else if (index > 50 && index <= 100) {
      color = Colors.yellow;
      textColor = Colors.black;
      text = "moderate".tr();
    } else if (index > 100 && index <= 150) {
      color = Colors.deepOrangeAccent;
      textColor = Colors.black;

      text = "sensitive_gr".tr();
    } else if (index > 150 && index <= 200) {
      color = Colors.red;
      textColor = Colors.white;

      text = "unhealthy".tr();
    } else if (index > 200 && index <= 250) {
      color = Colors.purple;
      textColor = Colors.white;

      text = "very_unhealthy".tr();
    } else if (index > 250 && index <= 300) {
      color = const Color.fromARGB(255, 158, 105, 123);
      text = "hazardous".tr();
      textColor = Colors.white;
    }
    return Container(
      color: color,
      child: Column(
        children: [
          Text(
            '${"aqi_index".tr()}: $index',
            style: TextStyle(color: textColor),
          ),
          Text(text!, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
