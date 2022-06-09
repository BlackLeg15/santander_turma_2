import 'package:mobx/mobx.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/params.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/usecase.dart';

import 'states/auth_store_states.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final Usecase loginWithUsernameAndPasswordUsecase;

  @observable
  AuthStoreStates state = AuthStoreInitialState();

  _AuthStoreBase(this.loginWithUsernameAndPasswordUsecase);

  @action
  Future<void> loginWithUsernameAndPasswrd(String username, String password) async {
    state = AuthStoreLoadingState();
    await Future.delayed(const Duration(seconds: 2));
    final result = await loginWithUsernameAndPasswordUsecase(Params(username, password));
    result.fold(
      (exception) {
        state = AuthStoreErrorState();
      },
      (user) {
        state = AuthStoreSuccessState(user.username);
      },
    );
  }
}
