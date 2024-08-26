import 'package:dermat/screens/product_details.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final int productId;
  final String productName;
  final double productPrice;
  final String productDescription;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
  });
}

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
  });

  final int productId;
  final String productName;
  final double productPrice;
  final String productImage = "productImage.png";
  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(productId: productId),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(productImage,
                  width: 100, height: 100, fit: BoxFit.cover),
              Text(productName),
              Text('\$${productPrice.toStringAsFixed(2)}'),
              Text(
                productDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
