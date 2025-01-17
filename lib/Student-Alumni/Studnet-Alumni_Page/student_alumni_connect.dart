import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/Student-Alumni/Widget/widget_container.dart';
import 'package:jobseek/Alumni%20Screens/alumni_register_page.dart';
import 'package:jobseek/Student%20Screens/student_register_page.dart';
import 'package:jobseek/util/image.dart';
import 'package:jobseek/util/string.dart';

class StudentAlumniConnect extends StatefulWidget {
  const StudentAlumniConnect({super.key});

  @override
  State<StudentAlumniConnect> createState() => _StudentAlumniConnectState();
}

class _StudentAlumniConnectState extends State<StudentAlumniConnect> {
  void _goToStudentLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => StudentRegistrationPage()));
  }

  void _goToAluminiLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AlumniRegistrationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(headline,
                style: GoogleFonts.josefinSans(
                    color: Color(0xff5FBC79),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Text(subHeadline, style: GoogleFonts.josefinSans(fontSize: 18)),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                WidgetContainer(
                    textLine: studentText,
                    studentImage: studentImage,
                    funtction: _goToStudentLogin),
                SizedBox(
                  width: 10,
                ),
                WidgetContainer(
                    textLine: aluminiText,
                    studentImage: aluminiImage,
                    funtction: _goToAluminiLogin),
              ],
            )
          ],
        ),
      ),
    );
  }
}
