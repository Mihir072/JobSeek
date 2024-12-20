import 'package:flutter/material.dart';
import 'package:jobseek/OnBoarding/OnBoarding_Page/OnBoarding_Page.dart';
import 'package:jobseek/util/image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashScreen() {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnBoardingPage())),
    );
  }

  @override
  void initState() {
    splashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(splashImage)),
    );
  }
}
