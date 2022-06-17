import 'package:brandie/view/auth/LoginScreen.dart';
import 'package:brandie/view/auth/sign_in.dart';
import 'package:flutter/material.dart';

import './models/constants.dart';
import './view/auth/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const MaterialColor(kPrimaryColor, kPrimaryColorList),
      ),
      home: const HomePageScreen(),
      routes: {
        SignInScreen.routeName: (ctx) => const SignInScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
      },
    );
  }
}
