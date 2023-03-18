import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:health_care/components/doctors.dart';
import 'package:health_care/components/home.dart';
import 'package:health_care/components/addpatient.dart';
import 'package:health_care/components/search.dart';
import 'package:http/http.dart' as http;
import '../model/patientdatamodel.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  late PatientDataModel? allPatienData;

  int _currentIndex = 0;
  List<Widget> _children = [
    Home(),
    Search(),
    AddPatient(),
    Doctors()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(255, 64, 95, 253),
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromARGB(102, 59, 62, 241),
        gap: 8,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        tabs: [
          const GButton(icon: Icons.home,
          text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search'
          ),
          const GButton(
            icon: Icons.add,
            text: 'Add',
            ),
          const GButton(
            icon: Icons.list,
            text: 'Doctors',
            )

        ]
      ),
    );
  }
}