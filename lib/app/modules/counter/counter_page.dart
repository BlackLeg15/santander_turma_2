import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santander_turma_2/app/modules/home/counter_notifier.dart';

/// Uma página para apresentar um `contador` que funciona
/// com [ChangeNotifier].
///![image](https://user-images.githubusercontent.com/16373553/94357272-d599e500-006d-11eb-9bcb-5f067943011e.png)
class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late CounterNotifier counterNotifier;
  late int number;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    counterNotifier = context.read<CounterNotifier>();
    number = context.read<int>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: counterNotifier,
              builder: (context, child) {
                return Text('${counterNotifier.value.toString()} & $number');
              }),
          ElevatedButton(
              onPressed: () {
                counterNotifier.increment();
              },
              child: const Text('Increment')),
        ],
      )),
    );
  }
}
