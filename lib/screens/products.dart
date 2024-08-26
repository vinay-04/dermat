import 'package:dermat/components/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of products here
    final List<ProductModel> products = List.generate(10, (index) {
      return ProductModel(
        productId: index + 1,
        productName: 'Product ${index + 1}',
        productPrice: (index + 1) * 10.0,
        productDescription: 'Description of Product ${index + 1}',
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in a row
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Product(
            productId: product.productId,
            productName: product.productName,
            productPrice: product.productPrice,
            productDescription: product.productDescription,
          );
        },
      ),
    );
  }
}
