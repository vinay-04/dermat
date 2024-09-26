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
      body: Center(
        child: Text("Anti-Aging Page"),
      ),
    );
    ;
  }
}
