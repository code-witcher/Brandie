import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product extends ChangeNotifier {
  final String id;
  final String name;
  final String size;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.size,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

class ProductsProvider extends ChangeNotifier {
  List<Product> _products = [];
  final url = 'https://brandie-58806-default-rtdb.firebaseio.com/';

  List<Product> get products {
    return [..._products];
  }

  Future<void> addProduct({
    required String name,
    required String size,
    required String description,
    required double price,
    required String imageUrl,
  }) async {
    final url = Uri.parse(
        'https://brandie-58806-default-rtdb.firebaseio.com/products.json');
    final response = await http.post(
      url,
      body: json.encode({
        'name': name,
        'size': size,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
      }),
    );
    print(json.decode(response.body)['name']);

    _products.add(
      Product(
        id: json.decode(response.body)['name'],
        name: name,
        size: size,
        description: description,
        price: price,
        imageUrl: imageUrl,
      ),
    );
    notifyListeners();
  }

  Future<void> getProducts() async {
    final url = Uri.parse(
        'https://brandie-58806-default-rtdb.firebaseio.com/products.json');
    final response = await http.get(url);
    if (response.body == null) {
      throw 'Error fetching data on product provider file line 73: '
          'response has Null value';
    }

    final data = json.decode(response.body) as Map<String, dynamic>;

    // print(json.decode(response.body));
    List<Product> _loadedProd = [];

    data.forEach((prodId, value) {
      _loadedProd.add(
        Product(
          id: prodId,
          name: value['name'],
          size: value['size'],
          description: value['description'],
          price: value['price'],
          imageUrl: value['imageUrl'],
        ),
      );
      // print('5 * ${_loadedProd.length}');
    });

    _products = _loadedProd;
    notifyListeners();
  }

  Future<void> updateProduct({
    required String prodId,
    required String name,
    required String size,
    required String description,
    required double price,
    required String imageUrl,
  }) async {
    final url = Uri.parse(
      'https://brandie-58806-default-rtdb.firebaseio.com/products/$prodId.json',
    );
    await http.patch(url,
        body: json.encode({
          'name': name,
          'size': size,
          'description': description,
          'price': price,
          'imageUrl': imageUrl,
        }));

    int index = _products.indexWhere((prod) => prod.id == prodId);
    _products[index] = Product(
      id: prodId,
      name: name,
      size: size,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
    notifyListeners();
  }

  Future<void> deleteProduct(String prodId) async {
    final url = Uri.parse(
      'https://brandie-58806-default-rtdb.firebaseio.com/products/$prodId.json',
    );
    await http.delete(url);
    _products.removeWhere((prod) => prod.id == prodId);
    notifyListeners();
  }
}
