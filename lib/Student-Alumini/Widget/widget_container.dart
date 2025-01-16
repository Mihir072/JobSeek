import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class WidgetContainer extends StatelessWidget {
  String studentImage;
  String textLine;
  VoidCallback funtction;
  WidgetContainer(
      {super.key,
      required this.textLine,
      required this.studentImage,
      required this.funtction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 265,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textLine,
              style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Image.asset(
              studentImage,
              height: 120,
            ),
            GestureDetector(
              onTap: funtction,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 90),
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
