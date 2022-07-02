import 'dart:io';

import 'package:brandie/models/products_provider4.dart';
import 'package:brandie/view/manage_products/widgets/image_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/add_product_field.dart';
import '../widgets/size_dropdown.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);
  static const routeName = '/add-product';

  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> initValues = {
    'name': '',
    'size': 'XL',
    'description': '',
    'imageUrl': '',
    'price': '',
  };

  Future<void> saveImage(File imageFile) async {
    await Firebase.initializeApp();

    final ref = FirebaseStorage.instance
        .ref()
        .child('imageUrl')
        .child('${UniqueKey()}.jpg');
    await ref.putFile(imageFile);

    initValues['imageUrl'] = await ref.getDownloadURL();
    print(initValues['imageUrl']);
  }

  Future<void> _save(BuildContext context, String prodId) async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState?.save();

    final prodProv = Provider.of<ProductsProvider>(context, listen: false);

    try {
      if (prodId == null) {
        await prodProv.addProduct(
          name: initValues['name'],
          size: initValues['size'],
          description: initValues['description'],
          price: double.parse(initValues['price']),
          imageUrl: initValues['imageUrl'],
        );
      } else {
        await prodProv.updateProduct(
          prodId: prodId,
          name: initValues['name'],
          size: initValues['size'],
          description: initValues['description'],
          price: double.parse(initValues['price']),
          imageUrl: initValues['imageUrl'],
        );
      }
    } catch (e) {
      print('in AddProduct line 54 $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final dynamic prodId = ModalRoute.of(context)?.settings.arguments;
    if (prodId != null) {
      final prods = Provider.of<ProductsProvider>(
        context,
        listen: false,
      ).products;
      final currentProd = prods.firstWhere((element) => element.id == prodId);

      initValues = {
        'name': currentProd.name,
        'size': currentProd.size,
        'description': currentProd.description,
        'imageUrl': currentProd.imageUrl,
        'price': '${currentProd.price}',
      };
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(prodId == null ? 'Add Product' : 'Edit Product'),
        actions: [
          IconButton(
            onPressed: () async {
              await _save(context, prodId);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AddProductField(
                  hint: 'Product Name',
                  initialValue: initValues['name'],
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name.';
                    }
                  },
                  onSaved: (value) {
                    initValues['name'] = value;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: AddProductField(
                        prefixIcon: const Icon(Icons.attach_money),
                        hint: 'Price',
                        initialValue: initValues['price'],
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter product price.';
                          }
                          if (double.parse(value) <= 0) {
                            return "Product price can't be less than 1";
                          }
                        },
                        onSaved: (value) {
                          initValues['price'] = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    SizeDropDown((value) {
                      initValues['size'] = value;
                      print(value);
                    }, initValues['size']),
                  ],
                ),
                AddProductField(
                  hint: 'Description',
                  maxLines: 5,
                  initialValue: initValues['description'],
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product description.';
                    }
                    if (value.length < 10) {
                      return "description should be more than 10 characters";
                    }
                  },
                  onSaved: (value) {
                    initValues['description'] = value;
                  },
                ),
                ImageWidget(saveImage),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () async {
                      await _save(context, prodId);
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(CupertinoIcons.add),
                    label: const Text('Add new Prod'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
