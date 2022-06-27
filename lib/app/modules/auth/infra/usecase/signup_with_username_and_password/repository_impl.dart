import 'package:dartz/dartz.dart';

import '../../../domain/usecases/signup_with_username_and_password/exceptions.dart';
import '../../../domain/usecases/signup_with_username_and_password/params.dart';
import '../../../domain/usecases/signup_with_username_and_password/repository.dart';
import '../../../domain/usecases/signup_with_username_and_password/result_typedef.dart';
import 'datasource.dart';

class RepositoryImpl implements Repository {
  final Datasource _datasource;

  RepositoryImpl(this._datasource);

  @override
  LoginResult call(Params params) async {
    try {
      final result = await _datasource(params);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownException(e.toString()));
    }
  }
}
