import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:netguru_values_generator/config.dart';
import 'package:netguru_values_generator/screens/consts/themes.dart';
import 'package:netguru_values_generator/screens/sentences/sentences_screen.dart';
import 'package:netguru_values_generator/services/routing/routing_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config().configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netguru sentences generator',
      onGenerateRoute: GetIt.I.get<RoutingService>().routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
