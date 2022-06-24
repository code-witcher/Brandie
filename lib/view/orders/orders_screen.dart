import 'package:brandie/models/constants.dart';
import 'package:brandie/view/products/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: kTextColor,
        ),
        title: Text(
          'Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: ExpansionTile(
        title: Text('Test'),
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, i) => Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                color: Colors.red,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
