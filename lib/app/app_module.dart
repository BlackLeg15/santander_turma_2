import 'package:flutter_modular/flutter_modular.dart';
import 'package:santander_turma_2/app/modules/animations/animations_page.dart';
import 'package:santander_turma_2/app/modules/listen_battery_from_platform/module.dart';

import 'modules/auth/presenter/auth_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/auth', module: AuthModule()),
    ChildRoute('/animations', child: (context, args) => const AnimationsPage()),
    ModuleRoute('/battery', module: ListenBatteryModule()),
  ];

}