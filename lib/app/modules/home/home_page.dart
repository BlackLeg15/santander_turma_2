import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:santander_turma_2/app/app_widget.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("home_page_title".i18n()),
          actions: [
            ElevatedButton.icon(
                onPressed: () {
                  Modular.to.pushNamed('animations');
                },
                icon: const Icon(Icons.animation),
                label: Text('home_page_animations'.i18n()))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('auth/');
                },
                child: Text('home_page_login'.i18n()),
              ),
              ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('auth/signup');
                },
                child: Text("home_page_create_account".i18n()),
              ),
              ElevatedButton(
                  onPressed: () {
                    final appState = context.findAncestorStateOfType<AppWidgetState>();
                    final newLocale = appState?.currentLocale == const Locale('pt', 'BR') ? const Locale('en', 'US') : const Locale('pt', 'BR');
                    appState?.changeLocale(newLocale);
                  },
                  child: const Text('Alterar localização')),
              ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed('battery');
                  },
                  child: const Text('Ir para Bateria')),
            ],
          ),
        ));
  }
}
