import 'package:aq_monitor/features/aq_feature/presentation/pages/setup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../core/injection_container.dart';
import '../bloc/aq_items_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
        ),
      ],
      showSkipButton: true,
      showNextButton: false,
      skip: const Text("Skip"),
      done: const Text("Done"),
      onDone: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) =>
                    sl<AqItemsBloc>()..add(GetCountriesEvent()),
                child: const SetupPage())));
      },
    );
  }
}
