import 'package:flutter/material.dart';

class Kit extends StatefulWidget {
  const Kit({super.key});

  @override
  State<Kit> createState() => _KitState();
}

class _KitState extends State<Kit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kit'),
      ),
      body: const Center(
        child: Text('Kit'),
      ),
    );
  }
}
