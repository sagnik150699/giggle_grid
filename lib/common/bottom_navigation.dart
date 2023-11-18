import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

var bottomNavigationBuilder = (BuildContext context, state, child) {
  return Scaffold(
    body: child,
    bottomNavigationBar: Container(
      padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 20.0),
      color: Colors.black,
      child: GNav(
        gap: 8,
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        //tabBackgroundColor: Colors.grey.shade700,
        padding: const EdgeInsets.all(16.0),
        textStyle: GoogleFonts.orbitron(fontSize: 17.0, color: Colors.white),
        iconSize: 33.0,
        onTabChange: (index) {
          if (index == 0) {
            context.go('/');
          } else if (index == 1) {
            context.go('/search');
          } else if (index == 2) {
            context.go('/favorites');
          }
        },
        tabs: const [
          GButton(
            icon: Icons.list,
            text: "Categories",
          ),
          GButton(
            icon: Icons.search_rounded,
            text: "Search",
          ),
          GButton(
            icon: Icons.favorite,
            text: "Favourite",
          )
        ],
      ),
    ),
  );
};
