import 'package:flutter_modular/flutter_modular.dart';

import 'auth_page.dart';
import 'auth_store.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const AuthPage()),
  ];
}
