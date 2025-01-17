import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  final String token;

  const StudentHomePage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Home Page'),
      ),
      body: Center(
        child: Text('Welcome Student! JWT Token: $token'),
      ),
    );
  }
}
