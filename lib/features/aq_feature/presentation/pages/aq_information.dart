import 'package:flutter/material.dart';

import '../../domain/entities/aq_item.dart';

class AqInformationPage extends StatelessWidget {
  final Item aqItem;

  const AqInformationPage({super.key, required this.aqItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(aqItem.data.country),
      ),
    );
  }
}
