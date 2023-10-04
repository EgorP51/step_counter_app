import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter_app/core/repositories/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = AuthRepository();

  AuthBloc() : super(const AuthState()) {
    on<ChangeLoginStatus>((event, emit) {
      emit(state.copyWith(isLogin: !(state.isLogin ?? true)));
    });
    on<AuthorizationEvent>(
      (event, emit) async {
        final user = await _authorizationEvent(event, emit);
        emit(state.copyWith(user: user));
      },
    );
  }

  Future<User?> _authorizationEvent(
    AuthorizationEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      if (event.email != null && event.password != null) {
        UserCredential user;

        if (state.isLogin == true) {
          user = await _authRepository.signInWithEmailAndPassword(
            event.email!,
            event.password!,
          );
        } else {
          user = await _authRepository.registerWithEmailAndPassword(
            event.email!,
            event.password!,
          );

          return user.user;
        }
      } else {
        // TODO: handle it!
        print("Проверить что не так! емайл и пароль приходят как налл!");
      }
    } catch (e) {
      // TODO: handle it
      rethrow;
    }
    return null;
  }
}
