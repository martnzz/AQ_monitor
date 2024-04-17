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
      title: const Text('States:'),
      content: Text('asd'),
      actions: [okButton],
    );
  }
}
