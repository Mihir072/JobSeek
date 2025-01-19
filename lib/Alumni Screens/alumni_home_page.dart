import 'package:flutter/material.dart';

class AlumniHomePage extends StatelessWidget {
  const AlumniHomePage({
    super.key,
    required String token,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Home Page'),
      ),
      body: Center(
        child: Text('Welcome Alumni!'),
      ),
    );
  }
}
