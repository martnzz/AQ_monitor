import 'package:aq_monitor/core/util/show_snackbar.dart';
import 'package:aq_monitor/features/aq_feature/presentation/bloc/aq_items_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: countryController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'country'.tr(),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              inputCountry = value;
              checkButtonState();
            },
          ),
          const SizedBox(height: 12),
          TextField(
            controller: stateController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'state'.tr(),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              inputState = value;
              checkButtonState();
            },
          ),
          const SizedBox(height: 12),
          TextField(
            controller: cityController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'city'.tr(),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              inputCity = value;
              checkButtonState();
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: isButtonDisabled ? null : dispatchSpecifiedCity,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Text(
              'specified_city'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: dispatchClosestCity,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Text(
              'closest_city'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> dispatchClosestCity() async {
    bool serviceEnabled;
    showInSnackBar('loading'.tr(), context);
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    serviceEnabled= await Geolocator.isLocationServiceEnabled();
    if(serviceEnabled){
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        try {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);

          BlocProvider.of<AqItemsBloc>(context).add(GetClosestAqItemEvent(
              lat: position.latitude, lon: position.longitude));
        } catch (e) {
          throw Exception();
        }
      }
    }else{
      showInSnackBar('no_permission'.tr(), context);
    }

  }

  void dispatchSpecifiedCity() {
    BlocProvider.of<AqItemsBloc>(context).add(
      GetSpecifiedAqItemEvent(
        city: inputCity!,
        country: inputCountry!,
        state: inputState!,
      ),
    );
  }

  void checkButtonState() {
    setState(() {
      isButtonDisabled = (inputCountry ?? '').isEmpty ||
          (inputState ?? '').isEmpty ||
          (inputCity ?? '').isEmpty;
    });
  }
}
