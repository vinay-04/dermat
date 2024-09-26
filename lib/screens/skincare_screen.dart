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
        title: const Text("Skincare"),
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
        child: Text("Skincare Page"),
      ),
    );
  }
}
