import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, this.productId});
  final productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Product $productId'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
