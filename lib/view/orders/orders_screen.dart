import 'dart:math';

import 'package:brandie/models/constants.dart';
import 'package:brandie/models/orders_provider.dart';
import 'package:brandie/view/products/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrdersProvider>(context);
    final orders = orderProvider.orders;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: kTextColor,
        ),
        title: Text(
          'Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: FutureBuilder(
        future: Provider.of<OrdersProvider>(context).fetchOrders(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order #${orders.length - i}',
                        ),
                        Text(
                          '\$${orders[i].totalPrice.toStringAsFixed(2)}',
                        ),
                        Text(DateFormat('dd/MM/yyy').format(orders[i].date)),
                      ],
                    ),
                    children: [
                      SizedBox(
                        height: min(orders[i].carts.length * 80, 200),
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: orders[i].carts.length,
                          itemBuilder: (ctx, ind) => Container(
                            height: 50,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(orders[i].carts[ind].imageUrl),
                              ),
                              title: Text(orders[i].carts[ind].name),
                              trailing: SizedBox(
                                width: 80,
                                child: Row(
                                  children: [
                                    Text('\$${orders[i].carts[ind].price}'),
                                    const Spacer(),
                                    Text('x${orders[i].carts[ind].quantity}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
