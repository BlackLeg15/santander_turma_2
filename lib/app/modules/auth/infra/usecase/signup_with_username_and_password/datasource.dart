import '../../../domain/usecases/signup_with_username_and_password/entity.dart';
import '../../../domain/usecases/signup_with_username_and_password/params.dart';

abstract class Datasource {
  Future<LoggedUserEntity> call(Params params);
}
