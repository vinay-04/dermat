import 'package:dermat/model/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:dermat/model/ProductModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import the ProductModel class

class ProductScroll extends ConsumerWidget {
  // Sample list of products
  final List<ProductModel> products = [
    ProductModel(
        productId: 1,
        productName: 'Tressheal',
        productPrice: 10.0,
        productDescription: '5% Minoxidil topical application hair serum'),
    ProductModel(
        productId: 2,
        productName: 'Hairmox ultra',
        productPrice: 15.0,
        productDescription:
            '5% Minoxidil+0.1% Finasteride concentrated hair serum'),
    ProductModel(
        productId: 3,
        productName: 'Organic flax seed',
        productPrice: 20.0,
        productDescription: '250 gm'),
    ProductModel(
        productId: 4,
        productName: 'Saw palmetto supplement',
        productPrice: 20.0,
        productDescription: ''),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return Container(
      height: 150, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 150, // Adjust width as needed
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200], // Background color for product card
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 2),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.productName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  '\$${product.productPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                SizedBox(height: 8),
                Text(
                  product.productDescription,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, // Handle overflow
                ),
                cartItems.any((item) => item.id == product.productId.toString())
                    ? Text(
                        'Quantity: ${cartItems.firstWhere((item) => item.id == product.productId.toString()).quantity}',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          final cartItem = CartProduct(
                              id: product.productId.toString(),
                              name: product.productName,
                              price: product.productPrice);
                          ref
                              .read(cartProvider.notifier)
                              .addCartProduct(cartItem);
                        },
                        child: Text('Add to Cart'))
              ],
            ),
          );
        },
      ),
    );
  }
}
