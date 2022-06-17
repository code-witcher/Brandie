import 'package:brandie/view/products/screens/main_page.dart';
import 'package:flutter/material.dart';

import '../../../models/constants.dart';
import '../screens/LoginScreen.dart';
import '../screens/sign_in.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key, this.isLogin = false}) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            isLogin ? 'Welcome Back' : 'Create Account',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: kLightColor,
                ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: kLightColor,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(180),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.57,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      if (!isLogin)
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person_outline_rounded),
                            hintText: 'Name',
                          ),
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                        ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Email',
                        ),
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Password',
                        ),
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ],
                  ),
                  if (isLogin)
                    TextButton(
                      style: TextButton.styleFrom(
                          alignment: AlignmentDirectional.centerEnd),
                      onPressed: () {},
                      child: const Text('Forget password?'),
                    ),
                  if (!isLogin)
                    const SizedBox(
                      height: 15,
                    ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: kLightColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        MainPage.routeName,
                      );
                    },
                    child: Text(
                      isLogin ? 'Log in' : 'Sign Up',
                    ),
                  ),
                  SizedBox(
                    height: 32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 2,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('Or'),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 130,
                          height: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        isLogin
                            ? SignUpScreen.routeName
                            : LoginScreen.routeName,
                      );
                    },
                    child: Text(isLogin ? 'Sign up' : 'Log in'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
