import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cart {
  final String id, name, imageUrl, size;
  final int quantity;
  final double price;

  Cart({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.size,
    required this.quantity,
    required this.price,
  });
}

class CartProvider extends ChangeNotifier {
  Map<String, Cart> _carts = {};

  Map<String, Cart> get carts {
    return {..._carts};
  }

  double totalPrice() {
    double total = 0;
    _carts.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  int totalQuantity() {
    int total = 0;
    _carts.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  Future<void> getItems() async {
    final url = Uri.parse(
        'https://brandie-58806-default-rtdb.firebaseio.com/carts.json');
    final response = await http.get(url);
    if (response.body == null) return;
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;

      final Map<String, Cart> loadedCarts = {};
      data.forEach((key, value) {
        loadedCarts.putIfAbsent(
          value['prodId'],
          () => Cart(
            id: key,
            name: value['name'],
            imageUrl: value['imageUrl'],
            size: value['size'],
            quantity: value['quantity'],
            price: value['price'],
          ),
        );
      });
      _carts = loadedCarts;
      notifyListeners();
    }
  }

  Future<void> addItem({
    required prodId,
    required name,
    required imageUrl,
    required size,
    required price,
  }) async {
    if (_carts.containsKey(prodId)) {
      final url =
          Uri.parse('https://brandie-58806-default-rtdb.firebaseio.com/carts/'
              '${_carts[prodId]?.id}.json');

      final response = await http.patch(
        url,
        body: json.encode({
          'quantity': _carts[prodId]!.quantity + 1,
        }),
      );
      print(json.decode(response.body));
      _carts.update(
        prodId,
        (value) => Cart(
          id: value.id,
          name: value.name,
          imageUrl: value.imageUrl,
          size: value.size,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    } else {
      final url = Uri.parse(
          'https://brandie-58806-default-rtdb.firebaseio.com/carts.json');
      final response = await http.post(
        url,
        body: json.encode(
          {
            'prodId': prodId,
            'name': name,
            'imageUrl': imageUrl,
            'size': size,
            'quantity': 1,
            'price': price,
          },
        ),
      );

      _carts.putIfAbsent(
        prodId,
        () => Cart(
          id: json.decode(response.body)['name'],
          name: name,
          imageUrl: imageUrl,
          size: size,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  Future<void> decreaseOrRemove(String prodId) async {
    if (!_carts.containsKey(prodId)) return;
    final url =
        Uri.parse('https://brandie-58806-default-rtdb.firebaseio.com/carts/'
            '${_carts[prodId]?.id}.json');

    if (_carts[prodId]!.quantity > 1) {
      final response = await http.patch(
        url,
        body: json.encode({
          'quantity': _carts[prodId]!.quantity - 1,
        }),
      );
      _carts.update(
        prodId,
        (value) => Cart(
          id: value.id,
          name: value.name,
          imageUrl: value.imageUrl,
          size: value.size,
          quantity: value.quantity - 1,
          price: value.price,
        ),
      );
    } else {
      await deleteItem(prodId);
    }
    notifyListeners();
  }

  Future<void> deleteItem(String prodId) async {
    if (!_carts.containsKey(prodId)) return;
    final url =
        Uri.parse('https://brandie-58806-default-rtdb.firebaseio.com/carts/'
            '${_carts[prodId]?.id}.json');

    http.delete(url);
    _carts.remove(prodId);
    notifyListeners();
  }

  Future<void> clear() async {
    final url = Uri.parse(
        'https://brandie-58806-default-rtdb.firebaseio.com/carts.json');
    await http.delete(url);
    _carts.clear();
    notifyListeners();
  }
}
