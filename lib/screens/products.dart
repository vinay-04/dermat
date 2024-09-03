import 'package:flutter/material.dart';
import 'package:dermat/components/Product.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // List of all products
  List<ProductModel> products = [];
  // List of filtered products for search
  List<ProductModel> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    products = List.generate(10, (index) {
      return ProductModel(
        productId: index + 1,
        productName: 'Product ${index + 1}',
        productPrice: (index + 1) * 10.0,
        productDescription: 'Description of Product ${index + 1}',
      );
    });
    filteredProducts = products; // Initially, show all products
  }

  void _filterProducts(String query) {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product.productName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterProducts,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in a row
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        padding: const EdgeInsets.all(10.0),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
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
