
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:santander_turma_2/app/modules/home/counter_notifier.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => AppWidgetState();
}

class AppWidgetState extends State<AppWidget> {
  var currentLocale = const Locale('pt', 'BR');

  void changeLocale(Locale locale) {
    setState(() {
      currentLocale = locale;
    });
  }

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
        LocalJsonLocalization.delegate.directories = [
          'lib/app/core/i18n'
        ];

        return MaterialApp.router(
          title: 'Santander Turma 2',
          theme: ThemeData(primarySwatch: Colors.blue),
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          localizationsDelegates: [
            ...GlobalMaterialLocalizations.delegates,
            LocalJsonLocalization.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
            Locale('en', 'US'),
          ],
          locale: currentLocale,
          localeListResolutionCallback: (locales, supportedLocales) {
            return currentLocale;
          },
        );
      },
    );
  }
}
