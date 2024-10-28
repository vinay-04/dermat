import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dermat/model/CartModel.dart';

class CartPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(cartProvider.notifier).clearCart();
            },
            icon: Icon(Icons.delete),
          ),
        ]
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartProduct = cartItems[index];
                      return ListTile(
                        title: Text(cartProduct.name),
                        subtitle: Row(
                          children: [
                            Text('Quantity: ${cartProduct.quantity}'),
                            IconButton(
                              icon: Icon(Icons.minimize),
                              onPressed: () {
                                ref.read(cartProvider.notifier).updateQuantity(cartProduct.id, cartProduct.quantity - 1);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                ref.read(cartProvider.notifier).updateQuantity(cartProduct.id, cartProduct.quantity + 1);
                              },
                            ),
                          ]
                        ),
                        trailing: Text('\$${(cartProduct.price * cartProduct.quantity).toStringAsFixed(2)}'),
                        leading: IconButton(
                          icon: Icon(Icons.minimize),
                          onPressed: () {
                            ref.read(cartProvider.notifier).removeCartProduct(cartProduct.id);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${ref.watch(cartProvider.notifier).totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Checkout is not available yet'),
                    ));
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
    );
  }
}
