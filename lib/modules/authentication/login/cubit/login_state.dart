import 'package:zero_waste_app/models/authentication/Login_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class ShowErrorIconFlagState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
// make it take parameter to listen on it in blocConsumer
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
