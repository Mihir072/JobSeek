import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/OnBoarding/Widget/OnBoarding_Widget.dart';
import 'package:jobseek/Student-Alumini/Studnet-Alumini_Page/student_alumini_connect.dart';
import 'package:jobseek/Util/image.dart';
import 'package:jobseek/Util/string.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _pageController = PageController();
  int _currentPage = 0;

  void _onChangedPage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToHome() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => StudentAluminiConnect()));
  }

  final List<Widget> _pages = [
    OnBoardingWidget(
        image: onBoardingImage1,
        headline: onBoardingHeadline1,
        subHeadline: onBoardingSubline1),
    OnBoardingWidget(
        image: onBoardingImage2,
        headline: onBoardingHeadline2,
        subHeadline: onBoardingSubline2),
    OnBoardingWidget(
        image: onBoardingImage3,
        headline: onBoardingHeadline3,
        subHeadline: onBoardingSubline3)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onChangedPage,
            children: _pages,
          ),
          Positioned(
              bottom: 70,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _pages.length; i++)
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == i ? 40 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                _currentPage == i ? Colors.blue : Colors.grey,
                            shape: BoxShape.rectangle)),
                ],
              )),
          _currentPage == _pages.length - 1
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: GestureDetector(
                    onTap: () => _goToHome(),
                    child: Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                        child: Text(nextButton,
                            style:
                                GoogleFonts.josefinSans(color: Colors.white)),
                      ),
                    ),
                  ))
              : Positioned(
                  bottom: 30,
                  right: 30,
                  child: GestureDetector(
                    onTap: () => _nextPage(),
                    child: Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24)),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
