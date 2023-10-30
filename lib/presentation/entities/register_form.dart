enum FormStatus { invalid, valid, validating }

class RegisterForm {
  final FormStatus formStatus;
  final String username;
  final String email;
  final String password;

  RegisterForm({
    required this.formStatus,
    required this.username,
    required this.email,
    required this.password,
  });

  RegisterForm copyWith({
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password,
  }) =>
      RegisterForm(
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
