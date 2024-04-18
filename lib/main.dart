import 'package:aq_monitor/core/notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:aq_monitor/core/injection_container.dart' as di;
import 'features/aq_feature/presentation/pages/onboarding_page.dart';
import 'package:background_fetch/background_fetch.dart';

const eventsKey = "fetch_events";


void backgroundFetchHeadlessTask(String taskId) async {
  // This is your background fetch task logic
  print("Background fetch initiated");
  // Finish the task
  BackgroundFetch.finish(taskId);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService().initNotification();
  await di.init();
  await EasyLocalization.ensureInitialized();




  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('hu', 'HU')],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );

  // Initialize BackgroundFetch
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);

  // Configure BackgroundFetch
  BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 15, // Fetch interval in minutes
      stopOnTerminate: false,
      enableHeadless: true,
    ),
        (String taskId) async {
      // Call your background task logic
      backgroundFetchHeadlessTask(taskId);
    },
  );

  // Start background fetch
  BackgroundFetch.start();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
    );
  }
}
