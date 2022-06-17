import 'package:brandie/view/auth/sign_in.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(SignInScreen.routeName);
            },
            child: Text('Sign in'),
          ),
        ],
      ),
    );
  }
}
