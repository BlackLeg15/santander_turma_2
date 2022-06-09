import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'stores/auth_store.dart';
import 'stores/states/auth_store_states.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final store = Modular.get<AuthStore>();
  late ReactionDisposer disposable;

  @override
  void initState() {
    super.initState();
    disposable = reaction((_) => store.state, (state) {
      if (state is AuthStoreSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logado. Seu nome é: ${state.username}')));
      }
    });
  }

  @override
  void dispose() {
    disposable.call();
    super.dispose();
  }

  var username = '';
  String? usernameError;

  var password = '';
  String? passwordError;

  void validateUsername() {
    usernameError = username.isEmpty ? 'Digite seu nome de usuário' : null;
  }

  void validatePassword() {
    passwordError = password.isEmpty ? 'Digite sua senha' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatefulBuilder(
              builder: (context, localSetState) {
                return TextField(
                  decoration: InputDecoration(
                    label: const Text('Nome de usuário'),
                    border: const OutlineInputBorder(),
                    errorText: usernameError,
                  ),
                  onChanged: (value) {
                    username = value;
                    localSetState(validateUsername);
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            StatefulBuilder(
              builder: (context, localSetState) {
                return TextField(
                  decoration: InputDecoration(label: const Text('Senha'), border: const OutlineInputBorder(), errorText: passwordError),
                  onChanged: (value) {
                    password = value;
                    localSetState(validatePassword);
                  },
                );
              },
            ),
            Observer(builder: (_) {
              return ElevatedButton(
                  onPressed: store.state is AuthStoreLoadingState
                      ? null
                      : () {
                          if (usernameError != null || passwordError != null) return;
                          store.loginWithUsernameAndPasswrd(username, password);
                        },
                  child: const Text('Entrar'));
            }),
          ],
        ),
      ),
    );
  }
}
