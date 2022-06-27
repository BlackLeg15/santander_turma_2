abstract class LoginException {
  final String message;

  LoginException(this.message);
}

class EmptyUsername extends LoginException {
  EmptyUsername(super.message);
}

class UnknownException extends LoginException {
  UnknownException(super.message);
}

class NotFoundUser extends LoginException {
  NotFoundUser(super.message);
}
