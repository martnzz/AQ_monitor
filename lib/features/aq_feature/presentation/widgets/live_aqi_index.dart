import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'aqi_color.dart';

class LiveAqiIndexText extends StatelessWidget {
  final int index;
  const LiveAqiIndexText({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: pollutionColor,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              '${"aqi_index".tr()}: $index',
              style: TextStyle(color: pollutionTextColor, fontSize: 25),
            ),
            Text(getPollutionText(index).tr(), style: TextStyle(color: pollutionTextColor,fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
