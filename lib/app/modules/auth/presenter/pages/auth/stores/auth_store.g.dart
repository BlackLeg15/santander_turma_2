// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$stateAtom = Atom(name: '_AuthStoreBase.state', context: context);

  @override
  AuthStoreStates get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AuthStoreStates value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$loginWithUsernameAndPasswrdAsyncAction = AsyncAction(
      '_AuthStoreBase.loginWithUsernameAndPasswrd',
      context: context);

  @override
  Future<void> loginWithUsernameAndPasswrd(String username, String password) {
    return _$loginWithUsernameAndPasswrdAsyncAction
        .run(() => super.loginWithUsernameAndPasswrd(username, password));
  }

  late final _$signupWithUsernameAndPasswrdAsyncAction = AsyncAction(
      '_AuthStoreBase.signupWithUsernameAndPasswrd',
      context: context);

  @override
  Future<void> signupWithUsernameAndPasswrd(String username, String password) {
    return _$signupWithUsernameAndPasswrdAsyncAction
        .run(() => super.signupWithUsernameAndPasswrd(username, password));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
