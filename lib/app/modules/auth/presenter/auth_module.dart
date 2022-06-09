import 'package:flutter_modular/flutter_modular.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/usecase_impl.dart';
import 'package:santander_turma_2/app/modules/auth/external/usecases/login_with_username_and_password/datasource_mock_impl.dart';
import 'package:santander_turma_2/app/modules/auth/external/usecases/login_with_username_and_password/mapper.dart';
import 'package:santander_turma_2/app/modules/auth/infra/usecase/login_with_username_and_password/repository_impl.dart';

import 'pages/auth/auth_page.dart';
import 'pages/auth/stores/auth_store.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(i())),
    Bind.lazySingleton((i) => UsecaseImpl(i())),
    Bind.lazySingleton((i) => RepositoryImpl(i())),
    Bind.lazySingleton((i) => DatasourceMockImpl(i())),
    Bind.lazySingleton((i) => Mapper()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const AuthPage()),
  ];
}
