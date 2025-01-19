import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jobseek/Alumni%20Screens/alumni_event_page.dart';
import 'package:jobseek/Alumni%20Screens/alumni_home_page.dart';
import 'package:jobseek/Alumni%20Screens/alumni_job_page.dart';
import 'package:jobseek/Alumni%20Screens/alumni_profile_page.dart';

class AlumniBottomBarPage extends StatefulWidget {
  final String token;
  final String alumniId;

  const AlumniBottomBarPage(
      {super.key, required this.token, required this.alumniId});

  @override
  State<AlumniBottomBarPage> createState() => _AlumniBottomBarPageState();
}

class _AlumniBottomBarPageState extends State<AlumniBottomBarPage> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize the pages list with dynamic values
    _pages = [
      AlumniHomePage(
        token: widget.token,
      ),
      const AlumniJobPage(),
      const AlumniEventPage(),
      AlumniProfilePage(token: widget.token, alumniId: widget.alumniId),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: GNav(
              gap: 8,
              activeColor: Colors.black,
              color: Colors.white,
              backgroundColor: Colors.black,
              tabBackgroundColor: Colors.white,
              padding: const EdgeInsets.all(13),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.event,
                  text: 'Events',
                ),
                GButton(
                  icon: Icons.work,
                  text: 'Jobs',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
