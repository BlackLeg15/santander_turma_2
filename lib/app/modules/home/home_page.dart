import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:santander_turma_2/app/modules/counter/counter_page.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

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
        title: const Text('Página inicial'),
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                Modular.to.pushNamed('animations');
              },
              icon: const Icon(Icons.animation),
              label: const Text('Animações'))
        ],
      ),
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: store,
        onState: (_, counter) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //Modular.to.pushNamed('auth');
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => const CounterPage())));
                  },
                  child: const Text('Entrar'),
                ),
                const ElevatedButton(onPressed: null, child: Text('Criar uma conta')),
              ],
            ),
          );
        },
        onError: (context, error) => const Center(
          child: Text(
            'Mensagem de erro',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
