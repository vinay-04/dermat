import 'package:flutter/material.dart';

class AntiagingScreen extends StatefulWidget {
  const AntiagingScreen({super.key});

  @override
  State<AntiagingScreen> createState() => _AntiagingScreenState();
}

class _AntiagingScreenState extends State<AntiagingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anti-Aging"),
        backgroundColor:const Color(0xFFFF6347),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              size: 36,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(),
              SizedBox(height: 20),
              _buildProductSection(),
              SizedBox(height: 20),
              _buildTechniqueSection(),
              SizedBox(height: 20),
              _buildNewsletterSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Naturally Inspired Anti-Aging Care',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFF6347),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Our anti-aging solutions are formulated with natural ingredients to rejuvenate and hydrate your skin, providing lasting youthfulness.',
          style: TextStyle(fontSize: 16, color: Colors.grey[900]),
        ),
      ],
    );
  }

  // Product Section
  Widget _buildProductSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured Product: Herbal Serum',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFF6347),
          ),
        ),
        SizedBox(height: 10),
        _buildProductCard(ContentData.products[0]),
        SizedBox(height: 10),
        Text(
          'Other Products You May Like',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFF6347),
          ),
        ),
        _buildProductCard(ContentData.products[1]),
        _buildProductCard(ContentData.products[2]),
      ],
    );
  }

  // Technique Section
  Widget _buildTechniqueSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Anti-Aging Techniques',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFF6347),
          ),
        ),
        SizedBox(height: 10),
        _buildTechniqueCard(ContentData.techniques[0]),
        _buildTechniqueCard(ContentData.techniques[1]),
        _buildTechniqueCard(ContentData.techniques[2]),
      ],
    );
  }

  // Newsletter Section
  Widget _buildNewsletterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subscribe to Get 15% Off Your First Order!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFF6347),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter your email',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Add subscription logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6347),
          ),
          child: Text('Subscribe'),
        ),
      ],
    );
  }

  // Build Product Card
  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(product.imagePath, height: 100, width: 100, fit: BoxFit.cover),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(product.description),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRating(product.rating),
                Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6347),
                ),
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build Technique Card
  Widget _buildTechniqueCard(Technique technique) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              technique.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(technique.description),
          ],
        ),
      ),
    );
  }

  // Build Rating Widget
  Widget _buildRating(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.yellow[700],
        );
      }),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imagePath; // Local image asset path
  final double rating;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.price,
  });
}

class Technique {
  final String name;
  final String description;

  Technique({
    required this.name,
    required this.description,
  });
}

class ContentData {
  static final List<Product> products = [
    Product(
      name: 'Herbal Anti-Aging Serum',
      description:
          'This serum is packed with natural antioxidants and vitamins to nourish and protect your skin, reducing the appearance of fine lines and wrinkles.',
      imagePath: 'assets/serum.png', // Local asset image path
      rating: 5.0,
      price: 65.00,
    ),
    Product(
      name: 'Night Repair Cream',
      description:
          'A rich cream designed to deeply hydrate and repair your skin overnight, restoring a youthful glow.',
      imagePath: 'assets/nightCream.png',
      rating: 4.5,
      price: 45.00,
    ),
    Product(
      name: 'Vitamin C Eye Gel',
      description:
          'A light gel that brightens dark circles and firms the skin around your eyes.',
      imagePath: 'assets/eyeGel.png',
      rating: 4.0,
      price: 35.00,
    ),
  ];

  static final List<Technique> techniques = [
    Technique(
      name: 'Facial Massage',
      description:
          'Massaging your face regularly stimulates circulation and promotes collagen production, helping your skin look firmer and more youthful.',
    ),
    Technique(
      name: 'Hydration is Key',
      description:
          'Keeping your skin well-hydrated is crucial for maintaining elasticity and reducing the appearance of wrinkles. Always use a hydrating serum or cream.',
    ),
    Technique(
      name: 'Sun Protection',
      description:
          'Protecting your skin from UV damage is one of the best ways to prevent premature aging. Always apply sunscreen before going outdoors.',
    ),
  ];
}
