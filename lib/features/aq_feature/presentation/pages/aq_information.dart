import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:aq_monitor/features/aq_feature/presentation/pages/navigation_drawer.dart';
import '../../domain/entities/aq_item.dart';
import '../widgets/aqi_color.dart';
import '../widgets/live_aqi_index.dart';

class AqInformationPage extends StatelessWidget {
  final Item aqItem;

  const AqInformationPage({super.key, required this.aqItem});

  @override
  Widget build(BuildContext context) {
    String dateString = aqItem.data!.current.weather.ts;
    List<String> parts = dateString.split('T');
    String datePart = parts[0];
    String timePart = parts[1].split('.')[0];
    String formattedDate = '$datePart $timePart';

    final weatherIcon = aqItem.data!.current.weather.ic;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          aqItem.data!.city,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor:
            getPollutionColor(aqItem.data!.current.pollution.aqius),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NavigationDrawerWidget(),
              ));
            },
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              aqItem.data!.country,
              style:
                  const TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              aqItem.data!.state,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            LiveAqiIndexText(
              index: aqItem.data!.current.pollution.aqius,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${"pressure".tr()}: ${aqItem.data!.current.weather.pr}',
                  style: const TextStyle(fontSize: 17.0),
                ),
                Text(
                  '${"temperature".tr()}: ${aqItem.data!.current.weather.tp}°C',
                  style: const TextStyle(fontSize: 17.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  '${"humidity".tr()}: ${aqItem.data!.current.weather.hu} %',
                  style: const TextStyle(fontSize: 17.0),
                ),
                Text(
                  '${"wind_speed".tr()}: ${aqItem.data!.current.weather.ws} m/s',
                  style: const TextStyle(fontSize: 17.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Image.asset(
                'assets/images/$weatherIcon.png',
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
