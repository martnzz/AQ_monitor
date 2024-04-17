import 'package:aq_monitor/core/util/show_snackbar.dart';
import 'package:aq_monitor/features/aq_feature/presentation/bloc/aq_items_bloc.dart';
import 'package:aq_monitor/features/aq_feature/presentation/pages/aq_information.dart';
import 'package:aq_monitor/features/aq_feature/presentation/widgets/setup_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AqItemsBloc, AqItemsState>(
          listener: (context, state) {
            if (state is Loading) {
              const CircularProgressIndicator();
            }
            else if (state is Loaded) {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AqInformationPage(aqItem: state.item!,)));
            }
            else if (state is Error) {
              showInSnackBar(state.message, context);
            }
          },
          child: BlocBuilder<AqItemsBloc, AqItemsState>(
            builder: (context, state) {
              if(state is Loading){
                return const CircularProgressIndicator();
              }

              return const SetupControls();
            },
          ),
        ),

    );
  }
}
