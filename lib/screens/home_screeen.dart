import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = size.width * 0.05;
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Section with Image and Card
            Stack(
              children: [
                // Image Section
                Container(
                  height: size.height * 0.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/lo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Card Section on top of the Image
                Positioned(
                  bottom: padding,
                  left: padding,
                  right: padding,
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
              ],
            ),
            SizedBox(height: size.height * 0.02),
            // Sale Section
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
                  Text(
                    "USE CODE - TRAYA30",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                    ),
                  ),
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
            SizedBox(height: size.height * 0.02),
            Card(
              margin: EdgeInsets.symmetric(horizontal: padding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "YOUR HAIR ANALYSIS REPORT",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Your hair analysis report is ready. Click below to view it.",
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
                    SizedBox(height: size.height * 0.01),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.02),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "View Report",
                            style: TextStyle(fontSize: size.width * 0.045),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
