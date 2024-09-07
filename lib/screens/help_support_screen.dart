import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildHelpTile('General Queries'),
          _buildHelpTile('Hair Test'),
          _buildHelpTile('Hair Coach'),
          _buildHelpTile('Diet Plan'),
          _buildHelpTile('Payments & Refunds'),
          _buildHelpTile('Moneyback Guarantee'),
        ],
      ),
    );
  }

  Widget _buildHelpTile(String title) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          // Navigate to the respective help page or show content
        },
      ),
    );
  }
}