import 'package:flutter_modular/flutter_modular.dart';
import 'package:santander_turma_2/app/modules/listen_battery_from_platform/battery_repository_platform_channel_impl.dart';
import 'package:santander_turma_2/app/modules/listen_battery_from_platform/controller.dart';
import 'package:santander_turma_2/app/modules/listen_battery_from_platform/page.dart';

class ListenBatteryModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => BatteryRepositoryPlatformChannelImpl()),
        Bind.lazySingleton((i) => ListenBatteryController(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ListenBatteryPage()),
      ];
}
