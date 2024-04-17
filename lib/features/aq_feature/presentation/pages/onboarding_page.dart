import 'package:aq_monitor/features/aq_feature/presentation/pages/setup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Change to desired color
      statusBarIconBrightness: Brightness.dark, // Change to desired brightness
    ));
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "setup_page_title".tr(),
            body: "setup_page_body".tr(),
            image: Image.asset("assets/images/setup_page.png"),
            decoration: const PageDecoration(
              pageColor: Colors.white,
              bodyTextStyle: TextStyle(fontSize: 18.0),
            ),
          ),
          PageViewModel(
            title: "aqi_title".tr(),
            body: "aqi_body".tr(),
            image: Image.asset("assets/images/aqi_info_page.png",),
            decoration: const PageDecoration(
              pageColor: Colors.white,
              bodyTextStyle: TextStyle(fontSize: 18.0),
            ),
          ),
          PageViewModel(
            title: "nav_title".tr(),
            body: "nav_body".tr(),
            image: Image.asset("assets/images/navigation_drawer_page.png"),
            decoration: const PageDecoration(
              pageColor: Colors.white,
              bodyTextStyle: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
        onDone: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const SetupPage(),
          ));
        },
        showSkipButton: true,
        skip: const Text("Skip",style: TextStyle(fontSize: 20),),
        done: const Text("Done",style: TextStyle(fontSize: 20),),
        next: const Icon(Icons.arrow_forward),
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          color: Colors.grey,
          activeColor: Theme.of(context).primaryColor,
          activeSize: const Size(20.0, 10.0),
          spacing: const EdgeInsets.all(5.0),
        ),
      ),
    );
  }
}
