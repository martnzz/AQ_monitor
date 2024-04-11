import 'package:flutter/material.dart';

void showInSnackBar(String value, context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(
        child: Text(
      value,
      style: const TextStyle(fontSize: 20),
    )),
  ));
}
