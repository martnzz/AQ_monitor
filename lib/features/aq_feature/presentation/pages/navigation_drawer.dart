import 'package:aq_monitor/features/aq_feature/presentation/widgets/about_widget.dart';
import 'package:aq_monitor/features/aq_feature/presentation/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';

import '../widgets/language_list_tile.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({
    super.key,
  });

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
          children: const [
            SettingsListTile(),
            Divider(),
            LanguageListTile(),
            Divider(),
          AboutWidget(),
            Divider(),
          ],
        ),

    );
  }
}
