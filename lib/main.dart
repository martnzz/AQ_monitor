import 'package:flutter/material.dart';
import 'package:aq_monitor/core/injection_container.dart' as di;
import 'features/aq_feature/presentation/pages/onboarding_page.dart';

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: OnBoardingPage(),);

  }
}
