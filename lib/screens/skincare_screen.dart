import 'package:dermat/screens/cart.Dart';
import 'package:flutter/material.dart';

class SkincareScreen extends StatefulWidget {
  const SkincareScreen({super.key});

  @override
  State<SkincareScreen> createState() => _SkincareScreenState();
}

class _SkincareScreenState extends State<SkincareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6347),
        title: const Text("Skincare"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 32,
            ),
          ),
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
      backgroundColor: Colors.orange[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            _buildTreatmentSection(),
            _buildContactSection(),
          ],
        ),
      ),
    );
  }

  // Building Header Section
  Widget _buildHeaderSection() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFF6347),
            image: DecorationImage(
              image: AssetImage('assets/headerImage.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          child: Text(
            'Best Treatment \nfor Your Skin',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // Building Treatment Cards Section
  Widget _buildTreatmentSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Treatment',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFF6347),
            ),
          ),
          SizedBox(height: 10),
          Text('Give you the best services we can give.',
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Column(
            children: treatments
                .map((treatment) => _buildTreatmentCard(treatment))
                .toList(),
          ),
        ],
      ),
    );
  }

  // Treatment Card Widget
  Widget _buildTreatmentCard(Treatment treatment) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                treatment.imageUrl,
              )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(treatment.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 5),
                Text(treatment.description, style: TextStyle(fontSize: 14)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Duration: ${treatment.duration}',
                        style: TextStyle(fontSize: 14)),
                    Text('\$${treatment.price}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Booking functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6347),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text('Book Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Contact Section
  Widget _buildContactSection() {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contacts',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
              'Address: 1 Mega Nu, Kota \nPhone: +62 83476982026\nEmail: metimebeauty@gmail.com'),
          SizedBox(height: 20),
          Text('Recent Posts', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInstagramPost('assets/insta1.png'),
              _buildInstagramPost('assets/insta2.png'),
              _buildInstagramPost('assets/insta3.png'),
            ],
          ),
        ],
      ),
    );
  }

  // Instagram Post Widget
  Widget _buildInstagramPost(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imageUrl,
        height: 80,
        width: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}

// Treatment Model
class Treatment {
  final String name;
  final String description;
  final String duration;
  final double price;
  final String imageUrl;

  Treatment({
    required this.name,
    required this.description,
    required this.duration,
    required this.price,
    required this.imageUrl,
  });
}

// Treatment Data
final treatments = [
  Treatment(
    name: 'Ultrasonic Scrubbing',
    description:
        'Removes dead skin cells and purifies pores using ultrasonic waves.',
    duration: '45 Min',
    price: 45.00,
    imageUrl: 'assets/scrubbing.png',
  ),
  Treatment(
    name: 'Dermalogica Face Peel',
    description: 'A gentle peel that rejuvenates skin and clears complexion.',
    duration: '30 Min',
    price: 70.00,
    imageUrl: 'assets/derma.png',
  ),
  Treatment(
    name: 'Micro Dermabrasion',
    description: 'Exfoliates skin to remove dull layers and improve texture.',
    duration: '50 Min',
    price: 50.00,
    imageUrl: 'assets/micro.png',
  ),
  Treatment(
    name: 'Carbon Laser Treatment',
    description: 'Deep cleanses pores and brightens skin tone.',
    duration: '45 Min',
    price: 120.00,
    imageUrl: 'assets/carbon.png',
  ),
  Treatment(
    name: 'Mini Facial',
    description: 'A refreshing facial for instant glow and rejuvenation.',
    duration: '30 Min',
    price: 30.00,
    imageUrl: 'assets/miniFacial.png',
  ),
  Treatment(
    name: 'Facial LED Light Therapy',
    description:
        'Non-invasive treatment for collagen stimulation and acne reduction.',
    duration: '30 Min',
    price: 90.00,
    imageUrl: 'assets/facial.png',
  ),
];
