import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:santander_turma_2/app/modules/listen_battery_from_platform/controller.dart';

class ListenBatteryPage extends StatefulWidget {
  const ListenBatteryPage({Key? key}) : super(key: key);

  @override
  State<ListenBatteryPage> createState() => _ListenBatteryPageState();
}

class _ListenBatteryPageState extends State<ListenBatteryPage> {
  final controller = Modular.get<ListenBatteryController>();

  var buildsCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<double>(
                stream: controller.batteryStream,
                builder: (context, snapshot) {
                  buildsCounter++;
                  return Column(
                    children: [
                      Text(
                        'Bateria: ${snapshot.data.toString()}',
                        style: const TextStyle(fontSize: 40),
                      ),
                      Text(
                        'Builds: ${buildsCounter.toString()}',
                        style: const TextStyle(fontSize: 40),
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
