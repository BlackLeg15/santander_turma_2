import 'package:santander_turma_2/app/core/mock_auth_backend/users.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/signup_with_username_and_password/exceptions.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/signup_with_username_and_password/params.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/signup_with_username_and_password/entity.dart';
import 'package:santander_turma_2/app/modules/auth/external/usecases/signup_with_username_and_password/mapper.dart';
import 'package:santander_turma_2/app/modules/auth/infra/usecase/signup_with_username_and_password/datasource.dart';

class DatasourceMockImpl implements Datasource {
  final MockAuthBackend _mockAuthBackend;
  final Mapper _mapper;

  DatasourceMockImpl(this._mapper, this._mockAuthBackend);

  @override
  Future<LoggedUserEntity> call(Params params) async {
    final result = _mockAuthBackend.signupWithUsernameAndPassword(params.username, params.password);
    return result.fold((exception) {
      throw NotAvailableUsername(exception.toString());
    }, (user) {
      return _mapper.fromJson(user);
    });
  }
}
