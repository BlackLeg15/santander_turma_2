import 'package:dartz/dartz.dart';

class MockAuthBackend {
  Map<String, Map<String, String>> users;

  MockAuthBackend(this.users);

  // MockAuthBackend _copyWith(Map<String, Map<String, String>>? users) {
  //   return MockAuthBackend(users ?? this.users);
  // }

  Either<Exception, Map<String, String>> loginWithUsernameAndPassword(String username, String password) {
    if (users.containsKey(username)) {
      return Right(users[username]!);
    }
    return Left(Exception('Usuário não existe'));
  }

  Either<Exception, Map<String, String>> signupWithUsernameAndPassword(String username, String password) {
    if (users.containsKey(username)) {
      return Left(Exception('Usuário já existe'));
    }
    users.addAll({
      username: {
        'username': username,
        'email': 'email'
      },
    });
    return Right(users[username]!);
  }
}
