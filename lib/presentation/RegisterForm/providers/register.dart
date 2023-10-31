import 'package:forms_app/infraestructure/inputs/inputsRegister.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register.g.dart';

enum FormStatus { invalid, valid, validating }

class RegisterForm {
  final FormStatus formStatus;
  final bool isValid;
  final UsernameZ username;
  final EmailZ email;
  final PasswordZ password;

  const RegisterForm(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.username = const UsernameZ.pure(),
      this.email = const EmailZ.pure(),
      this.password = const PasswordZ.pure()});

  RegisterForm copyWith({
    FormStatus? formStatus,
    bool? isValid,
    UsernameZ? username,
    EmailZ? email,
    PasswordZ? password,
  }) =>
      RegisterForm(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}

@riverpod
class RegisterFormState extends _$RegisterFormState {
  @override
  RegisterForm build() {
    return const RegisterForm();
  }

  void onSubmit() {
    state = state.copyWith(
        formStatus: FormStatus.validating,
        username: UsernameZ.dirty(state.username.value),
        password: PasswordZ.dirty(state.password.value),
        email: EmailZ.dirty(state.email.value),
        isValid: Formz.validate([
          state.username,
          state.password,
          state.email
          
        ]));

    print(state.username);
    print(state.password);
    print(state.isValid);
  }

  void userNameChanged(String value) {
    final userName = UsernameZ.dirty(value);
    state = state.copyWith(
        username: userName,
        isValid: Formz.validate([userName, state.password, state.email]));
  }

  void emailChanged(String value) {
    final email = EmailZ.dirty(value);
    state = state.copyWith(
      email: email,
      isValid: Formz.validate([
         email,
         state.username,
         state.password
      ])
    );
  }

  void passwordChanged(String value) {
    final password = PasswordZ.dirty(value);
    state = state.copyWith(
        password: password,
        isValid: Formz.validate([state.username, password, state.email]));
  }
}
