import 'package:brandie/helpers/badge.dart';
import 'package:brandie/models/cart_provider.dart';
import 'package:brandie/models/constants.dart';
import 'package:brandie/models/products_provider4.dart';
import 'package:brandie/view/cart/screens/cart_screen.dart';
import 'package:brandie/view/products/widgets/collections_list.dart';
import 'package:brandie/view/products/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/main-page';

  Future<void> fetchData(BuildContext context) async {
    Provider.of<ProductsProvider>(context, listen: false).getProducts();

    return Provider.of<CartProvider>(context, listen: false).getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kTextColor,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Collections',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: kTextColor,
              ),
        ),
        centerTitle: true,
        actions: [
          Badge(
            label: Consumer<CartProvider>(
              builder: (ctx, data, child) => FittedBox(
                child: Text(data.totalQuantity().toString()),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: kTextColor,
              ),
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: FutureBuilder(
        future: fetchData(context),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  if (MediaQuery.of(context).orientation ==
                      Orientation.portrait)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'Collections',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz_outlined,
                              color: kIconsColor,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (MediaQuery.of(context).orientation ==
                      Orientation.portrait)
                    const SizedBox(
                      height: 130,
                      child: CollectionList(),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          'New In',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: ProductsList(),
                  ),
                ],
              ),
      ),
      floatingActionButton: RawMaterialButton(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: 100,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fillColor: Theme.of(context).primaryColor,
        onPressed: () {},

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: kLightColor,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for a product',
                      hintStyle: TextStyle(
                        color: kLightColor,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Provider.of<ProductsProvider>(context, listen: false)
                      .addProduct(
                    name: 'Shirt',
                    size: 'XL',
                    description: 'This is a nice shirt for a nice person which '
                        'made of 100% of cotton and a cent of love',
                    price: 60.00,
                    imageUrl:
                        'https://i.pinimg.com/564x/e4/07/20/e40720c646c72a70e0b793bfaa8cc37d.jpg',
                  );
                },
                icon: const Icon(
                  Icons.filter_list_rounded,
                  color: kLightColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
