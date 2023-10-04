import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter_app/core/ui/custom_text_field.dart';
import 'package:step_counter_app/features/auth/management/auth_bloc.dart';
import 'package:step_counter_app/features/statistic/presentation/pages/statistic_page.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({
    super.key,
  });

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 2 / 5,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Text(
                    state.isLogin == true ? 'login_page' : 'registration_page',
                  ),
                  CustomTextField(
                    controller: emailController,
                    labelText: 'email',
                  ),
                  CustomTextField(
                    controller: passwordController,
                    labelText: 'password',
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        BlocProvider.of<AuthBloc>(context).add(
                          ChangeLoginStatus(),
                        );
                      });
                    },
                    child: Text(
                      state.isLogin == true ? 'to to register' : 'go to login',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        AuthorizationEvent(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return StatisticPage(user: state.user);
                        }),
                      );
                    },
                    child: Text(state.isLogin == true ? 'login' : 'register'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
