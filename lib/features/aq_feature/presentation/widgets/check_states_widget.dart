import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CheckStates extends StatelessWidget {
  const CheckStates({super.key});

  @override
  Widget build(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text('Ok'),
      onPressed: () { },
    );
    return AlertDialog(
      title: Text("states".tr()),
      content: const Text('asd'),
      actions: [okButton],
    );
  }
}
