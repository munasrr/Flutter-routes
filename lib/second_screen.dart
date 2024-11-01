import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String imageUrl;

  const SecondScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.network(
            imageUrl, 
            width: double.infinity,
            height: 250, 
            fit: BoxFit.contain, 
          ),
        ),
      ),
    );
  }
}
