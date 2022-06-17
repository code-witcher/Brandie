import 'package:brandie/models/constants.dart';
import 'package:brandie/view/products/widgets/collections_list.dart';
import 'package:brandie/view/products/widgets/products_list.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/main-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: Text('Collections'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      backgroundColor: kBlue,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Collection',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz_outlined,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 130,
            child: CollectionList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
    );
  }
}
