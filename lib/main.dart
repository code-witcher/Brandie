import 'package:brandie/models/products_provider4.dart';
import 'package:brandie/view/cart/screens/cart_screen.dart';
import 'package:brandie/view/manage_products/screens/add_product.dart';
import 'package:brandie/view/manage_products/screens/manage_products.dart';
import 'package:brandie/view/orders/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './models/constants.dart';
import './view/auth/screens/LoginScreen.dart';
import './view/auth/screens/sign_in.dart';
import './view/products/screens/main_page.dart';
import './view/products/screens/product_details.dart';
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
    return ChangeNotifierProvider<ProductsProvider>(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Sulphur',
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
          primarySwatch: const MaterialColor(kPrimaryColor, kPrimaryColorList),
          canvasColor: kLightColor,
        ),
        home: const HomePageScreen(),
        routes: {
          SignUpScreen.routeName: (ctx) => const SignUpScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          MainPage.routeName: (ctx) => const MainPage(),
          ProductDetails.routeName: (ctx) => const ProductDetails(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          ManageProducts.routeName: (ctx) => const ManageProducts(),
          AddProduct.routeName: (ctx) => AddProduct(),
        },
      ),
    );
  }
}
