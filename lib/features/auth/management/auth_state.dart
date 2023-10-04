part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool? isLogin;
  final User? user;

  void setIsLogin(bool? value) => isLogin ?? value;

  const AuthState({
    this.isLogin = true,
    this.user,
  });

  AuthState copyWith({
    bool? isLogin,
    User? user,
  }) {
    return AuthState(
      isLogin: isLogin ?? this.isLogin,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props {
    return [
      isLogin,
      user,
    ];
  }
}
