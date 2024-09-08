import 'package:flutter/material.dart';

class Kit extends StatefulWidget {
  const Kit({super.key});

  @override
  State<Kit> createState() => _KitState();
}

class _KitState extends State<Kit> {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Assessment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sarah, 35',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "You've been diagnosed with",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Text(
                  'Mild Acne, Type II Skin',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Treatment duration',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Text(
                  '3 months',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Skin Improvement possibility 87%',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  color: Colors.blue[50],
                  child: Text(
                    'Mild acne is often caused by excess oil production and clogged pores. '
                    'At your stage, most skin issues are treatable. This is the best time '
                    'to start treatment as there is a very high chance of seeing visible skin improvement.',
                    style: TextStyle(color: Colors.blue[800]),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'Your Skin Condition Root Causes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCauseItem(Icons.spa, 'Hormones', isSmallScreen),
                    _buildCauseItem(
                        Icons.sanitizer, 'Oil Production', isSmallScreen),
                    _buildCauseItem(
                        Icons.restaurant_menu, 'Diet', isSmallScreen),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  '₹1799',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text('Inclusive of all taxes'),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, screenHeight * 0.07),
                  ),
                  child: const Text('Buy Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCauseItem(IconData icon, String label, bool isSmallScreen) {
  return Column(
    children: [
      Icon(icon, size: isSmallScreen ? 30 : 40, color: Colors.orange),
      SizedBox(height: isSmallScreen ? 2 : 4),
      Text(label, style: TextStyle(fontSize: isSmallScreen ? 10 : 12)),
    ],
  );
}
