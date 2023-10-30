import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms_app/presentation/providers/register.dart';
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

class _RegisterForm extends ConsumerStatefulWidget {
  const _RegisterForm();

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<_RegisterForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
  final register = ref.watch(registerFormStateProvider);

    return Form(
        key: _formkey,
        child: Column(
          children: [
            CustomTextFormFiel(
                label: 'Nombre de usuario',
                onChanged: (value) {
                  ref.read(registerFormStateProvider.notifier).userNameChanged(value);
                  _formkey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo Requerido';
                  if (value.trim().isEmpty) return 'Campo Requerido';
                  if (value.length < 6) return 'Debe ser mayor a 6 caracteres';

                  return null;
                }),
            CustomTextFormFiel(
              label: 'Correo Electronico',
              onChanged: (value) {
                ref.read(registerFormStateProvider.notifier).emailChanged(value);
                _formkey.currentState?.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo Requerido';
                if (value.trim().isEmpty) return 'Campo Requerido';

                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );

                if(!emailRegExp.hasMatch(value)) return 'No tiene formato de corro';

                return null;
              },
            ),
            CustomTextFormFiel(
              label: 'Contraseña',
              obscuretext: true,
              onChanged: (value) {
                ref.read(registerFormStateProvider.notifier).passwordChanged(value);
                _formkey.currentState?.validate();
              },
              validator: (value) {
                   if (value == null || value.isEmpty) return 'Campo Requerido';
                  if (value.trim().isEmpty) return 'Campo Requerido';
                  if (value.length < 6) return 'Debe ser mayor a 6 caracteres';
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
                onPressed: () {
                   final isvalidate =  _formkey.currentState!.validate();
                    if(!isvalidate) return ;

                  ref.read(registerFormStateProvider.notifier).onSubmit();
                  

                  
                },
                icon: const Icon(Icons.save),
                label: const Text(' Registrar')),
          ],
        ));
  }
}
