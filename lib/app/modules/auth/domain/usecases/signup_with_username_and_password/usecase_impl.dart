import 'package:dartz/dartz.dart';

import 'exceptions.dart';
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
      return Left(EmptyUsername('Nome de usuário vazio'));
    }
    return _repository(params);
  }
}
