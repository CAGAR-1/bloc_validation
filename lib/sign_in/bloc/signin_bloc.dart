import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SignInTextEvent>(signInTextEvent);
    on<SignInSubmittedEvent>(signInSubmittedEvent);
  }

  FutureOr<void> signInTextEvent(
      SignInTextEvent event, Emitter<SigninState> emit) {
    if (event.emailValue.length < 7) {
      emit(SignInErrorState("Please Enter a valid Email Address"));
    } else if (event.passwordValue.length < 6) {
      emit(SignInErrorState("Please Enter a valid Password"));
    } else {
      emit(SignInValidState());
    }
  }

  FutureOr<void> signInSubmittedEvent(
      SignInSubmittedEvent event, Emitter<SigninState> emit) {
    emit(SigninLoadingState());
  }
}
