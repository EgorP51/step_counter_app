import 'package:flutter/material.dart';
import 'package:step_counter_app/features/auth/presentation/widgets/auth_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthWidget(isLogin: true);
  }
}
