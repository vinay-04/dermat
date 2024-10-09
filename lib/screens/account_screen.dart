import 'package:dermat/components/UserData.dart';
import 'package:flutter/material.dart';
import 'package:dermat/screens/profile_screen.dart';
import 'package:dermat/screens/help_support_screen.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _showProfile = false;

  void _toggleProfile() {
    setState(() {
      _showProfile = !_showProfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _showProfile
          ? MyProfileScreen(onBackPressed: _toggleProfile)
          : AccountScreen(onProfilePressed: _toggleProfile),
    );
  }
}

class AccountScreen extends StatelessWidget {
  final VoidCallback onProfilePressed;

  AccountScreen({required this.onProfilePressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFFB5E4CA),
              child: Text('J', style: TextStyle(color: Color(0xFFFF6347))),
            ),
            SizedBox(width: 8),
            Text('jeevan', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.black),
            onPressed: onProfilePressed,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildBuyKitCard(context),
          SizedBox(height: 16),
          _buildQuickActionButtons(context),
          SizedBox(height: 16),
          _buildAllProductsTile(),
          _buildTermsAndPoliciesTile(),
          _buildReadMoreTile()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            scrollControlDisabledMaxHeightRatio: 0.8,
            builder: (BuildContext context) {
              return UserDataBottomSheet();
            },
          );
        },
        child: Icon(Icons.details),
      ),
    );
  }

  Widget _buildBuyKitCard(BuildContext context) {
    return Card(
      color: Color(0xFFFF6347),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.shopping_cart, color: Colors.white),
                SizedBox(width: 8),
                Text('Once you buy your kit,',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Traya doctors will approve your plan and build a detailed prescription.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Buy Now'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFFFF6347),
                backgroundColor: Color(0xFFB5E4CA),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(Icons.trending_up, 'Hair Progress'),
        _buildActionButton(
          Icons.help_outline,
          'Help & Support',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpAndSupportScreen()),
            );
          },
        ),
        _buildActionButton(Icons.chat_bubble_outline, 'Chat With Us'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label,
      {VoidCallback? onPressed}) {
    return Expanded(
      child: Card(
        color: Color(0xFFF1FDF5),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Icon(icon, color: Color(0xFFFF6347)),
                SizedBox(height: 4),
                Text(label,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAllProductsTile() {
    return ListTile(
      title: Text('All Products'),
      trailing: Icon(Icons.chevron_right),
    );
  }

  Widget _buildTermsAndPoliciesTile() {
    return ExpansionTile(
      title: Text('Terms & Policies'),
      children: [
        _buildPolicyTile('Refund, Return & Cancellation Policy'),
        _buildPolicyTile('Money Back Policy'),
        _buildPolicyTile('Privacy Policy'),
        _buildPolicyTile('Terms & Conditions'),
      ],
    );
  }

  Widget _buildReadMoreTile() {
    return ExpansionTile(
      title: Text('Read More'),
      children: [
        _buildPolicyTile('Reference cited'),
        _buildPolicyTile('Traya Science'),
      ],
    );
  }

  Widget _buildPolicyTile(String title) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
