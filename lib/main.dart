import 'package:aq_monitor/core/notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:aq_monitor/core/injection_container.dart' as di;
import 'core/util/format_date.dart';
import 'features/aq_feature/presentation/bloc/aq_items_bloc.dart';
import 'features/aq_feature/presentation/pages/onboarding_page.dart';
import 'package:background_fetch/background_fetch.dart';

@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(String taskId) async {
  String? hour;
  int? aqiIndex;
  final aqItemsBloc = di.sl<AqItemsBloc>();
  aqItemsBloc.add(GetNotificationItemEvent());
  aqItemsBloc.stream.listen((state) {
    if (state is NotificationLoaded) {
      if (getHour(state.item!.data!.current.weather.ts) != hour) {
        hour = getHour(state.item!.data!.current.weather.ts);
        aqiIndex = state.item!.data!.current.pollution.aqius;
        NotificationService().showNotification(
            title: 'Air Quality Changed!', body: 'AQI Index: $aqiIndex');
        BackgroundFetch.finish(taskId);
      } else {
        print('asd.com');
        BackgroundFetch.finish(taskId);
      }
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize BackgroundFetch
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);

  // Configure BackgroundFetch
  await BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 15, // Fetch interval in minutes
      stopOnTerminate: false,
      enableHeadless: true,
    ),
    (String taskId) async {
      backgroundFetchHeadlessTask(taskId);
    },
  );

  // Initialize other services
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
