import 'dart:async';

import 'package:btk_todo/domain/token_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '/core/core.dart';
import '/data/data.dart';
import '/domain/domain.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.tokenRepository,
  }) : super(const LoginState()) {
    ///
    on<LoginUsernameChanged>(_onUsernameChanged);

    ///
    on<LoginPasswordChanged>(_onPasswordChanged);

    ///
    on<LoginSubmitted>(_onSubmitted);
  }

  final TokenRepository tokenRepository;

  /// [1 Username] alanı doldurulduğunda kontrol
  FutureOr<void> _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    ///
    final username = UsernameInput.dirty(event.username);

    emit(
      state.copyWith(
        username: username,
        status: LoginStatus.edit,
        isValid: Formz.validate([username, state.password]),
      ),
    );
  }

  /// [2 Password] alanı doldurulduğunda kontrol
  FutureOr<void> _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    ///
    final password = PasswordInput.dirty(event.password);

    emit(
      state.copyWith(
        password: password,
        status: LoginStatus.edit,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }

  FutureOr<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    ///
    if (!state.isValid) return;

    /// Request'i hazırlayalım
    final request = LoginRequest(
      username: state.username.value,
      password: state.password.value,
    );

    /// Metodu çağır
    final result = await tokenRepository.loginUser(request: request);

    ///
    result.fold(
      /// [Handle left]: Error Type
      (LoginFailure failure) => emit(
        state.copyWith(
          status: LoginStatus.failure,
        ),
      ),

      /// [Handle right]: Response Type
      (response) {
        return emit(
          state.copyWith(
            status: LoginStatus.authenticated,
          ),
        );
      },
    );
  }
}
