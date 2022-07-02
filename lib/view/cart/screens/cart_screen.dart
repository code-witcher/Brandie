import 'package:brandie/models/cart_provider.dart';
import 'package:brandie/models/orders_provider.dart';
import 'package:brandie/view/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final carts = cartProvider.carts;

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
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'My Cart',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_horiz_outlined,
                      color: kIconsColor,
                      size: 32,
                    ),
                    itemBuilder: (ctx) => [
                      PopupMenuItem(
                        child: Text('Clear All'),
                        onTap: () {
                          cartProvider.clear();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, i) => CartItem(
                  carts.values.toList()[i],
                  carts.keys.toList()[i],
                ),
                itemCount: carts.length,
                itemExtent: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey.shade500,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${cartProvider.totalPrice().toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Text(
                    'Shipping',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey.shade500,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${(carts.length * 4.35).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            OrderButton(carts: carts, cartProvider: cartProvider),
          ],
        ),
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.carts,
    required this.cartProvider,
  }) : super(key: key);

  final Map<String, Cart> carts;
  final CartProvider cartProvider;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          MediaQuery.of(context).size.width * 0.8,
          60,
        ),
        shape: const StadiumBorder(),
      ),
      onPressed: widget.carts.isEmpty
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<OrdersProvider>(
                context,
                listen: false,
              ).addOrder(
                carts: widget.carts.values.toList(),
                totalPrice: widget.cartProvider.totalPrice(),
              );
              await widget.cartProvider.clear();

              setState(() {
                _isLoading = false;
              });
            },
      child: _isLoading
          ? const CircularProgressIndicator(
              color: kLightColor,
            )
          : Text(
              'Order Now',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: kLightColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
    );
  }
}
