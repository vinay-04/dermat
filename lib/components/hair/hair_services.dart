import 'package:flutter/material.dart';

class HairServices extends StatelessWidget {
  const HairServices({super.key, required this.size, required this.padding});

  final Size size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Text(
            "Our Services",
            style: TextStyle(
              fontSize: size.width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconColumn(context, Icons.wash, "Hair Wash"),
              _buildIconColumn(context, Icons.local_hospital, "Hair Treatment"),
              _buildIconColumn(context, Icons.local_bar, "Hair Coloring"),
            ],
          ),
        ],
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
