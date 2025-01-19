import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  final String token;
  final String studentId;

  const StudentHomePage(
      {super.key, required this.token, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Home Page'),
      ),
      body: Center(
        child: Row(
          children: [
            Text('Welcome Student! JWT Token: $token'),
            Text('Welcome Student! Student ID: $studentId')
          ],
        ),
      ),
    );
  }
}
