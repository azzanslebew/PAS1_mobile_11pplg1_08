import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedLabelStyle: GoogleFonts.manrope(fontWeight: FontWeight.w600),
      unselectedLabelStyle: GoogleFonts.manrope(),
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xff156651),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'My Wishlist'),
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'My Account'),
      ],
    );
  }
}
