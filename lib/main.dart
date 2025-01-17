import 'package:flutter/material.dart';
import 'package:jobseek/Screens/splash_page.dart';
import 'package:jobseek/Student%20Screens/student_register_page.dart';
import 'package:jobseek/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
