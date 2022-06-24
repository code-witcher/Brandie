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

  final Map<String, dynamic> data = {
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

    data['imageUrl'] = await ref.getDownloadURL();
    print(data['imageUrl']);
  }

  Future<void> _save(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState?.save();

    final prodProv = Provider.of<ProductsProvider>(context, listen: false);

    try {
      await prodProv.addProduct(
          name: data['name'],
          size: data['size'],
          description: data['description'],
          price: double.parse(data['price']),
          imageUrl: data['imageUrl']);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Product'),
        actions: [
          IconButton(
            onPressed: () async {
              await _save(context);
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
                  initialValue: data['name'],
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name.';
                    }
                  },
                  onSaved: (value) {
                    data['name'] = value;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: AddProductField(
                        prefixIcon: const Icon(Icons.attach_money),
                        hint: 'Price',
                        initialValue: data['price'],
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
                          data['price'] = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    SizeDropDown((value) {
                      data['size'] = value;
                      print(value);
                    }),
                  ],
                ),
                AddProductField(
                  hint: 'Description',
                  maxLines: 5,
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
                    data['description'] = value;
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
                      await _save(context);
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
