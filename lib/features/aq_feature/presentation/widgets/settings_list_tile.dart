import 'package:aq_monitor/features/aq_feature/presentation/pages/setup_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'settings'.tr(context: context),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 26,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SetupPage()));
      },
    );
  }
}
