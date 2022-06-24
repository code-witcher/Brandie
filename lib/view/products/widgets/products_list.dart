import 'package:brandie/models/products_provider4.dart';
import 'package:brandie/view/products/widgets/Product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Consumer<ProductsProvider>(
        builder: (ctx, prod, child) => GridView.builder(
          // scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) => ProductItem(product: prod.products[i]),
          itemCount: prod.products.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 290,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 320,
          ),
        ),
      ),
    );
  }
}
