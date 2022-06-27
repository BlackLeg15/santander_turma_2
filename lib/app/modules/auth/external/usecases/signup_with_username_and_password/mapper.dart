import 'package:santander_turma_2/app/modules/auth/domain/usecases/signup_with_username_and_password/entity.dart';

class Mapper {
  LoggedUserEntity fromJson(Map json) {
    return LoggedUserEntity(json['username'], json['email']);
  }
}
