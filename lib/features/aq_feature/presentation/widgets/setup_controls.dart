import 'package:aq_monitor/features/aq_feature/presentation/bloc/aq_items_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injection_container.dart';

class SetupControls extends StatefulWidget {
  const SetupControls({super.key});

  @override
  State<SetupControls> createState() => _SetupControlsState();
}

class _SetupControlsState extends State<SetupControls> {
  final cityController = TextEditingController();
  String? inputCity;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: cityController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: 'City'),
          onChanged: (value){
            inputCity=value;
          },
        ),
        ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          child: const Text(
            'Specified City',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ElevatedButton(
          onPressed: dispatchClosestCity,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          child: const Text(
            'Closest City',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
  void dispatchClosestCity() {
    BlocProvider.of<AqItemsBloc>(context).add(GetClosestAqItemEvent());

  }
}
