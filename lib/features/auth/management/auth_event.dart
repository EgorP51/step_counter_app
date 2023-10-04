part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeLoginStatus extends AuthEvent {}

class AuthorizationEvent extends AuthEvent {
  final String? email;
  final String? password;

  AuthorizationEvent(this.email, this.password);
}
