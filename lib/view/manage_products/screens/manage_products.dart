import 'package:brandie/models/products_provider4.dart';
import 'package:brandie/view/manage_products/screens/add_product.dart';
import 'package:brandie/view/products/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);
  static const routeName = '/manage-products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddProduct.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: FutureBuilder(
        future:
            Provider.of<ProductsProvider>(context, listen: false).getProducts(),
        builder: (ctx, snapshotData) => snapshotData.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<ProductsProvider>(
                builder: (ctx, prods, child) => ListView.builder(
                  itemCount: prods.products.length,
                  itemBuilder: (ctx, i) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(prods.products[i].imageUrl),
                          ),
                          title: Text(
                            prods.products[i].name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: FractionallySizedBox(
                            widthFactor: 0.28,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    prods.deleteProduct(prods.products[i].id);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Theme.of(context).errorColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        indent: 16,
                        endIndent: 16,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
