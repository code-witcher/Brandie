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
        backgroundColor: Colors.transparent,
        title: Text(
          'Collections',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: kTextColor,
              ),
        ),
        centerTitle: true,
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
        children: [
          if (MediaQuery.of(context).orientation == Orientation.portrait)
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
          if (MediaQuery.of(context).orientation == Orientation.portrait)
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
                onPressed: () {},
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
