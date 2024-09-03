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

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the products list
    products = List.generate(10, (index) {
      return ProductModel(
        productId: index + 1,
        productName: 'Product ${index + 1}',
        productPrice: (index + 1) * 10.0,
        productDescription: 'Description of Product ${index + 1}',
      );
    });

    // Initially display all products
    filteredProducts = products;

    // Add a listener to the search controller to filter products as user types
    searchController.addListener(() {
      filterProducts();
    });
  }

  void filterProducts() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredProducts = products.where((product) {
        return product.productName.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
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

class Product extends StatelessWidget {
  final int productId;
  final String productName;
  final double productPrice;
  final String productDescription;

  const Product({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Price: ₹$productPrice'),
            SizedBox(height: 8.0),
            Text(productDescription),
          ],
        ),
      ),
    );
  }
}
