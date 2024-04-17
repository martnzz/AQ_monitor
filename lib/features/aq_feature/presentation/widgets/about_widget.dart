import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'about'.tr(context: context),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 26,
          ),
        ),
      ),
      onTap: () {
        showAboutDialog(context: context,applicationName: 'aq_monitor', applicationVersion: 'Version: 1.0.3');
      },
    );
  }
}