part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninInvalidState extends SigninState {}

class SignInValidState extends SigninState {}

class SignInErrorState extends SigninState {
  String Errormessage;
  SignInErrorState(this.Errormessage);
}

class SigninLoadingState extends SigninState {}
