import 'package:brandie/view/products/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './models/constants.dart';
import './view/auth/screens/LoginScreen.dart';
import './view/auth/screens/sign_in.dart';
import 'view/auth/screens/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
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
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        primarySwatch: const MaterialColor(kPrimaryColor, kPrimaryColorList),
      ),
      home: const HomePageScreen(),
      routes: {
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        MainPage.routeName: (ctx) => const MainPage(),
      },
    );
  }
}
