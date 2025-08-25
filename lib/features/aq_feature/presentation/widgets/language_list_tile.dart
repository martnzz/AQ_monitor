import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization_checker.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'language'.tr(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 26,
          ),
        ),
      ),
      onTap: () {
        LocalizationChecker.changeLanguage(context);
      },
    );
  }
}
