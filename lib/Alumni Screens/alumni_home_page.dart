import 'package:flutter/material.dart';

class AlumniHomePage extends StatelessWidget {
  final String token;

  const AlumniHomePage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Home Page'),
      ),
      body: Center(
        child: Text('Welcome Alumni! JWT Token: $token'),
      ),
    );
  }
}
