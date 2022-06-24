import 'package:brandie/models/constants.dart';
import 'package:brandie/view/manage_products/screens/manage_products.dart';
import 'package:brandie/view/orders/orders_screen.dart';
import 'package:brandie/view/products/screens/main_page.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Text(
              'Brandie',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MainPage.routeName);
            },
            leading: const Icon(
              Icons.store,
              size: 40,
              color: kTextColor,
            ),
            title: Text(
              'Shop',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
            leading: const Icon(
              Icons.shopping_bag_rounded,
              size: 40,
              color: kTextColor,
            ),
            title: Text(
              'Orders',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ManageProducts.routeName);
            },
            leading: const Icon(
              Icons.manage_accounts,
              size: 40,
              color: kTextColor,
            ),
            title: Text(
              'Manage Products',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
