import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:santander_turma_2/app/modules/home/counter_notifier.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterNotifier()),
        Provider(create: (context) => 42),
      ],
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Santander Turma 2',
          theme: ThemeData(primarySwatch: Colors.blue),
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        );
      },
    );
  }
}
