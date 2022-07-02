import 'package:brandie/view/products/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../models/constants.dart';
import '../screens/LoginScreen.dart';
import '../screens/sign_in.dart';

class AuthWidget extends StatelessWidget {
  AuthWidget({Key? key, this.isLogin = false}) : super(key: key);
  final bool isLogin;

  String? username;
  String? userEmail;
  String? userPassword;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.09,
            horizontal: 16,
          ),
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
          child: ClipPath(
            clipper: WaveClipperTwo(
              reverse: true,
              // flip: true,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: kLightColor,
              ),
              height: MediaQuery.of(context).size.height * 0.57,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            if (!isLogin)
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon:
                                      Icon(Icons.person_outline_rounded),
                                  hintText: 'Name',
                                ),
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please tell us what is your name!';
                                  }
                                  if (value.length < 3) {
                                    return 'Sorry! username should be at least 3 characters';
                                  }
                                },
                              ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Email',
                              ),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email!';
                                }
                                if (!value.contains('.com') ||
                                    !value.contains('.com')) {
                                  return 'Please enter a valid email address';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.vpn_key),
                                hintText: 'Password',
                              ),
                              obscureText: true,
                              // obscuringCharacter: "ه",
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password for your account!';
                                }
                                if (value.length < 6) {
                                  return 'Sorry! password can be at least 6 characters';
                                }
                              },
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
                                height: 1,
                                color: Colors.grey.shade500,
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
                                height: 1,
                                color: Colors.grey.shade500,
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
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
            ),
          ),
        ),
      ],
    );
  }
}
