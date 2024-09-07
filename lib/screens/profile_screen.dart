import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  final VoidCallback onBackPressed;

  MyProfileScreen({required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: onBackPressed,
        ),
        title: Text('My Profile', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Text('jeevan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('69, Male',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 24),
            _buildInfoTile('Email ID', ''),
            _buildInfoTile('Phone No.', '+916374954911'),
            _buildInfoTile('Preferred Language', ''),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('My Hair Profile'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('My Diet Profile'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 24),
            _buildDiagnosisTile(
                'Current diagnosis', 'Male Pattern Hair Loss, Stage-2'),
            _buildDiagnosisTile('Root Cause', 'Dandruff, Genetics, Nutrition'),
            _buildDiagnosisTile('Hair Goal', 'Regrow hair'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 16)),
        Divider(),
      ],
    );
  }

  Widget _buildDiagnosisTile(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.green),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
                SizedBox(height: 4),
                Text(value, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
