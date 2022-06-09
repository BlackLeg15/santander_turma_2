import 'package:dartz/dartz.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/exceptions.dart';

import 'params.dart';
import 'repository.dart';
import 'result_typedef.dart';
import 'usecase.dart';

class UsecaseImpl implements Usecase {
  final Repository _repository;

  UsecaseImpl(this._repository);

  @override
  LoginResult call(Params params) async {
    if (params.username.isEmpty) {
      return Left(EmptyUsername());
    }
    return _repository(params);
  }
}
