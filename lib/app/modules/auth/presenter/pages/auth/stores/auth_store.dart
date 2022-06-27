import 'package:mobx/mobx.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/params.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/usecase.dart';

import 'package:santander_turma_2/app/modules/auth/domain/usecases/signup_with_username_and_password/params.dart' as signup;
import 'package:santander_turma_2/app/modules/auth/domain/usecases/signup_with_username_and_password/usecase.dart' as signup;

import 'states/auth_store_states.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final Usecase loginWithUsernameAndPasswordUsecase;
  final signup.Usecase signupWithUsernameAndPasswordUsecase;

  @observable
  AuthStoreStates state = AuthStoreInitialState();

  _AuthStoreBase(this.loginWithUsernameAndPasswordUsecase, this.signupWithUsernameAndPasswordUsecase);

  @action
  Future<void> loginWithUsernameAndPasswrd(String username, String password) async {
    state = AuthStoreLoadingState();
    await Future.delayed(const Duration(seconds: 2));
    final result = await loginWithUsernameAndPasswordUsecase(Params(username, password));
    result.fold(
      (exception) {
        state = AuthStoreErrorState(exception.message);
      },
      (user) {
        state = AuthStoreSuccessState(user.username);
      },
    );
  }

  @action
  Future<void> signupWithUsernameAndPasswrd(String username, String password) async {
    state = AuthStoreLoadingState();
    await Future.delayed(const Duration(seconds: 2));
    final result = await signupWithUsernameAndPasswordUsecase(signup.Params(username, password));
    result.fold(
      (exception) {
        state = AuthStoreErrorState(exception.message);
      },
      (user) {
        state = AuthStoreSuccessState(user.username);
      },
    );
  }
}
