import 'package:flutter/material.dart';
import 'package:step_counter_app/core/ui/custom_text_field.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({super.key, this.isLogin = true});

  bool isLogin;

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
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 2 / 5,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(widget.isLogin ? 'login_page' : 'registration_page'),
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
                    widget.isLogin = !widget.isLogin;
                  });
                },
                child: Text(widget.isLogin ? 'to to register' : 'go to login'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: implement registration logic in bloc and call it here!
                  // onLoginPressed(
                  //   emailController.text,
                  //   passwordController.text,
                  // );
                },
                child: Text(widget.isLogin ? 'login' : 'register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
