import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class UsernameZ extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  const UsernameZ.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UsernameZ.dirty(String value ) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    
    if(value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if( value.length < 6) return UsernameError.length;

    return null;
  }
}