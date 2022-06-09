import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:santander_turma_2/app/modules/auth/auth_store.dart';
import 'package:santander_turma_2/app/modules/auth/states/auth_store_states.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.toString())));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Observer(
          builder: ((context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    label: const Text('Username'),
                    border: const OutlineInputBorder(),
                    errorText: usernameError,
                  ),
                  onChanged: (value) {
                    username = value;
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    border: const OutlineInputBorder(),
                    errorText: passwordError
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
