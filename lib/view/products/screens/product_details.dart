import 'dart:math';

import 'package:brandie/models/constants.dart';
import 'package:brandie/view/cart/screens/cart_screen.dart';
import 'package:brandie/view/products/widgets/sized_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products_provider4.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final dynamic prodId = ModalRoute.of(context)?.settings.arguments;
    final products = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).products;
    final currentProd = products.firstWhere((prod) => prod.id == prodId);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: kTextColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Products',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: kTextColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                currentProd.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            color: kColorsList[Random().nextInt(4)],
                            // borderRadius: BorderRadius.circular(500),
                          ),
                        ),
                        PositionedDirectional(
                          bottom: 0,
                          start: 16,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kLightColor,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: kIconsColor,
                                width: 3,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            currentProd.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            child: Text(
                              '\$${currentProd.price}',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizeRow(size: currentProd.size),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      currentProd.description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Add To Chart',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: kLightColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
