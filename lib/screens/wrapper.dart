import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values_generator/blocs/initialization/initialization_bloc.dart';
import 'package:netguru_values_generator/screens/core/loading_screen.dart';
import 'package:netguru_values_generator/services/routing/routing_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<InitializationBloc, InitializationState>(
        listener: (context, state) async {
          if (!state.isLoading) {
            if (state.didConfigureApp) {
              Navigator.of(context).pushReplacementNamed(Screens.sentences);
            } else {
              Navigator.of(context).pushReplacementNamed(Screens.error);
            }
          }
        },
        child: LoadingScreen(),
      ),
    );
  }
}
