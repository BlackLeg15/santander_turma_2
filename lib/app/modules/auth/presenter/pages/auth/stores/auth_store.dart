import 'package:mobx/mobx.dart';

import 'states/auth_store_states.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  AuthStoreStates state = AuthStoreInitialState();

  @action
  Future<void> loginWithUsernameAndPasswrd() async {
    state = AuthStoreLoadingState();
    await Future.delayed(const Duration(seconds: 2));
    state = AuthStoreSuccessState();
  }
}
