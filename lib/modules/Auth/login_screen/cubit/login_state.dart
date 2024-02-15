part of 'login_cubit.dart';

@immutable
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class ChangePasswordVisibilityState extends LoginStates {}
