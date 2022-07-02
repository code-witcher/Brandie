import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cart_provider.dart';

class Order {
  String id;
  List<Cart> carts;
  double totalPrice;
  DateTime date;

  Order({
    required this.id,
    required this.carts,
    required this.totalPrice,
    required this.date,
  });
}

class OrdersProvider extends ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  Future<void> addOrder({
    required List<Cart> carts,
    required double totalPrice,
  }) async {
    final date = DateTime.now();
    final url = Uri.parse(
        'https://brandie-58806-default-rtdb.firebaseio.com/orders.json');
    final response = await http.post(
      url,
      body: json.encode({
        'totalPrice': totalPrice,
        'carts': carts
            .map((item) => {
                  'id': item.id,
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'quantity': item.quantity,
                  'price': item.price,
                  'size': item.size,
                })
            .toList(),
        'date': date.toIso8601String(),
      }),
    );

    _orders.insert(
      0,
      Order(
        id: json.decode(response.body)['name'],
        carts: carts,
        totalPrice: totalPrice,
        date: date,
      ),
    );
    notifyListeners();
  }

  Future<void> fetchOrders() async {
    final url = Uri.parse(
        'https://brandie-58806-default-rtdb.firebaseio.com/orders.json');
    final response = await http.get(url);

    if (response.statusCode != 200) return;

    final data = json.decode(response.body) as Map<String, dynamic>;

    List<Order> loadedData = [];
    data.forEach((key, value) {
      final carts = value['carts'] as List<dynamic>;
      final cart = carts
          .map(
            (value) => Cart(
              id: 'id',
              name: value['name'],
              imageUrl: value['imageUrl'],
              size: '',
              quantity: value['quantity'],
              price: value['price'],
            ),
          )
          .toList();

      print(carts);
      loadedData.add(
        Order(
          id: key,
          carts: cart,
          totalPrice: value['totalPrice'],
          date: DateTime.parse(value['date']),
        ),
      );
    });

    _orders = loadedData;
    notifyListeners();
  }
}
