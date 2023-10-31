import 'package:formz/formz.dart';

enum UsernameError { empty, length }

class UsernameZ extends FormzInput<String, UsernameError> {
  const UsernameZ.pure() : super.pure('');
  const UsernameZ.dirty(String value) : super.dirty(value);
  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == UsernameError.empty) return 'El usuario es requerido';
    if (displayError == UsernameError.length) {
      return 'El usuario debe de contener al menos 6 caracteres';
    }
    return null;
  }

  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.length;
    return null;
  }
}

enum PasswordError { empty, length }

class PasswordZ extends FormzInput<String, PasswordError> {
  const PasswordZ.pure() : super.pure('');
  const PasswordZ.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return 'El password es requerido';
    if (displayError == PasswordError.length) {
      return 'El password debe ser mayor a 8 caracteres';
    }
    return null;
  }

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 8) return PasswordError.length;
    return null;
  }
}

enum EmailError { empty, format }

class EmailZ extends FormzInput<String, EmailError> {
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  const EmailZ.pure() : super.pure('');
  const EmailZ.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (displayError == EmailError.empty) {
      return 'El correo electronico es requerido';
    }
    if (displayError == EmailError.format) {
      return 'No tiene el formato de correo electronico';
    }
    return null;
  }

  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;

    if (!emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
