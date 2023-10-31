import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms_app/presentation/RegisterForm/providers/register.dart';

import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const name = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: const _RegisterView());
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final register = ref.watch(registerFormStateProvider);
    final username = register.username;
    final email = register.email;
    final password = register.password;

    return Form(
        child: Column(
      children: [
        CustomTextFormFiel(
            label: 'Nombre de usuario',
            onChanged: (value) {
              ref
                  .read(registerFormStateProvider.notifier)
                  .userNameChanged(value);
            },
            errorMessage: username.errorMessage),
        CustomTextFormFiel(
          label: 'Correo Electronico',
          onChanged: (value) {
            ref.read(registerFormStateProvider.notifier).emailChanged(value);
          },
          errorMessage: email.errorMessage,
          
        ),
        CustomTextFormFiel(
            label: 'Contraseña',
            obscuretext: true,
            onChanged: (value) {
              ref
                  .read(registerFormStateProvider.notifier)
                  .passwordChanged(value);
            },
            errorMessage: password.errorMessage),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
            onPressed: () {
              ref.read(registerFormStateProvider.notifier).onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text(' Registrar')),
      ],
    ));
  }
}
