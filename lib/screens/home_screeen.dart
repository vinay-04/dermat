import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = size.width * 0.05;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image
            Container(
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Section with Sale Information
                Container(
                  padding: EdgeInsets.all(padding),
                  color: Colors.green,
                  child: Column(
                    children: [
                      Text(
                        "Hair growth is possible, you're in the right hands.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        "RIGHT TO GROW SALE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "FLAT 30% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "USE CODE - TRAYA30",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "10th - 12th Aug",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
                // Image Section
                Container(
                  height: size.height * 0.4,
                  child: Image.asset(
                    'assets/lo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Card Section
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Jeevan",
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "Here's what your hair analysis report says:",
                            style: TextStyle(fontSize: size.width * 0.04),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "YOUR ROOT CAUSES",
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildIconColumn(
                                  context, Icons.water_drop, "DANDRUFF"),
                              _buildIconColumn(context, Icons.dns, "GENETICS"),
                              _buildIconColumn(
                                  context, Icons.apple, "NUTRITION"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Traya Heroes Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    "Traya Heroes",
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconColumn(BuildContext context, IconData icon, String label) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Icon(icon, color: Colors.yellow, size: size.width * 0.08),
        Text(label, style: TextStyle(fontSize: size.width * 0.03)),
      ],
    );
  }
}
