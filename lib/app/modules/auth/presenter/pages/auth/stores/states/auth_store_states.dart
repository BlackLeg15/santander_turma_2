abstract class AuthStoreStates {}

class AuthStoreInitialState extends AuthStoreStates {}

class AuthStoreLoadingState extends AuthStoreStates {}

class AuthStoreSuccessState extends AuthStoreStates {
  final String username;

  AuthStoreSuccessState(this.username);
}

class AuthStoreErrorState extends AuthStoreStates {}
