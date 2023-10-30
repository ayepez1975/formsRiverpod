import 'package:forms_app/presentation/entities/register_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register.g.dart';

@riverpod
class RegisterFormState extends _$RegisterFormState {
  @override
  RegisterForm build() {
    return RegisterForm(
      formStatus: FormStatus.invalid,
      username: '',
      email: '',
      password: '',
    );
  }

  void onSubmit() {
   
   print(state.username);
   print(state.email);
   print(state.password);

    
  }

  void userNameChanged(String value) {
    state =  state.copyWith(username: value);
      
    
  }

  void emailChanged(String value) {
    state = state.copyWith(email: value);
  }

  void passwordChanged(String value) {
    state =  state.copyWith(password: value);
  }
}
