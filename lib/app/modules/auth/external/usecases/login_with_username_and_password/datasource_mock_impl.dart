import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/params.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/entity.dart';
import 'package:santander_turma_2/app/modules/auth/external/usecases/login_with_username_and_password/mapper.dart';
import 'package:santander_turma_2/app/modules/auth/infra/usecase/login_with_username_and_password/datasource.dart';

class DatasourceMockImpl implements Datasource {
  final Mapper _mapper;

  DatasourceMockImpl(this._mapper);

  @override
  Future<LoggedUserEntity> call(Params params) async {
    return LoggedUserEntity('Novo usuário', 'adby@gmail.com');
  }
}
