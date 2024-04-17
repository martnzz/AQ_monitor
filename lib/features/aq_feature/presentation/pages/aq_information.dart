import 'package:flutter/material.dart';

import '../../domain/entities/aq_item.dart';
import '../widgets/live_aqi_index.dart';

class AqInformationPage extends StatelessWidget {
  final Item aqItem;

  const AqInformationPage({super.key, required this.aqItem});

  @override
  Widget build(BuildContext context) {

    String dateString= aqItem.data!.current.weather.ts;
    List<String> parts = dateString.split('T');
    String datePart = parts[0];
    String timePart = parts[1].split('.')[0];
    String formattedDate = '$datePart $timePart';

    final weatherIcon = aqItem.data!.current.weather.ic;

    return Scaffold(
      appBar: AppBar(
        title: Text(aqItem.data!.city),
      ),
      body: Center(
        child: Column(
          children: [
            Text(aqItem.data!.country),
            Text(aqItem.data!.state),
            Text(formattedDate),
            LiveAqiIndexText(
              index: aqItem.data!.current.pollution.aqius,
            ),
            Text(aqItem.data!.current.weather.pr.toString()),
            Text('Temperature: ${aqItem.data!.current.weather.tp} C'),
            Text('Humidity: ${aqItem.data!.current.weather.hu} %'),
            Text('Wind speed: ${aqItem.data!.current.weather.ws} (m/s)'),
            Image.asset('assets/images/$weatherIcon.png'),
          ],
        ),
      ),
    );
  }
}
