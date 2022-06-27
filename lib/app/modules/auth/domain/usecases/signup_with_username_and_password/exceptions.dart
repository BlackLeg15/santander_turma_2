abstract class Exception {
  final String message;

  Exception(this.message);
}

class EmptyUsername extends Exception {
  EmptyUsername(super.message);
}

class UnknownException extends Exception {
  UnknownException(super.message);
}

class NotAvailableUsername extends Exception {
  NotAvailableUsername(super.message);
}
