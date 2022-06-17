import 'package:brandie/models/constants.dart';
import 'package:brandie/view/auth/screens/LoginScreen.dart';
import 'package:brandie/view/auth/screens/sign_in.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kLightColor,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'To the first app which contains all the brands',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: kLightColor,
                    ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kLightColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: Text(
                  'Log in',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: kLightColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: kLightColor),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(SignUpScreen.routeName);
                },
                child: const Text(
                  'Sign up',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
