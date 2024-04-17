import 'package:aq_monitor/features/aq_feature/presentation/bloc/aq_items_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupControls extends StatefulWidget {
  const SetupControls({super.key});

  @override
  State<SetupControls> createState() => _SetupControlsState();
}

class _SetupControlsState extends State<SetupControls> {
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  String? inputCountry;
  String? inputState;
  String? inputCity;
  bool isButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: countryController,
          textInputAction: TextInputAction.next,
          decoration:  InputDecoration(labelText: 'country'.tr()),
          onChanged: (value) {
            inputCountry = value;
            checkButtonState();
          },
        ),
        TextField(
          controller: stateController,
          textInputAction: TextInputAction.next,
          decoration:  InputDecoration(labelText: 'state'.tr()),
          onChanged: (value) {
            inputState= value;
            checkButtonState();
          },
        ),
        TextField(
          controller: cityController,
          textInputAction: TextInputAction.next,
          decoration:  InputDecoration(labelText: 'city'.tr()),
          onChanged: (value) {
            inputCity = value;
            checkButtonState();
          },
        ),
        ElevatedButton(
          onPressed: dispatchSpecifiedCity,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          child:  Text(
            'specified_city'.tr(),
            style: const TextStyle(fontSize: 16),
          ),
        ),
        ElevatedButton(
          onPressed: dispatchClosestCity,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          child:  Text(
            'closest_city'.tr(),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  void dispatchClosestCity() {
    BlocProvider.of<AqItemsBloc>(context).add(GetClosestAqItemEvent());
  }

  void dispatchSpecifiedCity() {
    BlocProvider.of<AqItemsBloc>(context)
        .add(GetSpecifiedAqItemEvent(city: inputCity!, country: inputCountry!, state: inputState!));
  }
  void checkButtonState() {
    setState(() {
      isButtonDisabled =
          (inputCountry ?? '').isEmpty || (inputState ?? '').isEmpty || (inputCity?? '').isEmpty;
    });
  }
}
