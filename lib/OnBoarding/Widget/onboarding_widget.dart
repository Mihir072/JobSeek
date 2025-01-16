import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingWidget extends StatelessWidget {
  final String image;
  final String headline;
  final String subHeadline;

  const OnBoardingWidget(
      {super.key,
      required this.image,
      required this.headline,
      required this.subHeadline});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset(image),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              headline,
              style: GoogleFonts.josefinSans(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(
              subHeadline,
              style: GoogleFonts.josefinSans(
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
