// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:photoapp/Components/HomeComp.dart';
import 'package:photoapp/Components/LikesComp.dart';
import 'package:photoapp/Components/SettingsComp.dart';
import 'package:photoapp/Components/UserComp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String base64Image = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        HomeComp(),
        LikesComp(),
        SettingsComp(),
        UserComp(),
      ][currentIndex],
      bottomNavigationBar: GNav(
          selectedIndex: currentIndex,
          onTabChange: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineIcons.heart,
              text: 'Likes',
            ),
            GButton(
              icon: LineIcons.cog,
              text: 'Settings',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profile',
            )
          ]),
    );
  }
}
