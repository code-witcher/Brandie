import 'dart:math';

import 'package:brandie/models/constants.dart';
import 'package:brandie/view/products/widgets/sized_row.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
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
                            shape: BoxShape.circle,
                            color: kColorsList[Random().nextInt(4)],
                            // borderRadius: BorderRadius.circular(500),
                          ),
                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(500),
                          //   child: Image.network(
                          //     'https://i.pinimg.com/564x/e4/07/20/e40720c646c72a70e0b793bfaa8cc37d.jpg',
                          //     // fit: BoxFit.cover,
                          //   ),
                          // ),
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
                            'Full Color Hoodie',
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
                              '\$120.45',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedRow(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Full color Hoodie. Mutlicolored panels and visionary embroldery '
                      'on the chest. Made Portugal 100% Cotton',
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
