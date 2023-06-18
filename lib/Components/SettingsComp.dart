// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photoapp/providers/Theme.dart';
import 'package:provider/provider.dart';

class SettingsComp extends StatefulWidget {
  const SettingsComp({super.key});

  @override
  State<SettingsComp> createState() => _SettingsCompState();
}

class _SettingsCompState extends State<SettingsComp> {
  var themeValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            trailing: Switch(
                value: context.read<MyTheme>().themeValue,
                onChanged: (value) {
                  context.read<MyTheme>().changeTheme(value == false
                      ? ThemeData.light(useMaterial3: true)
                      : ThemeData.dark(useMaterial3: true));
                  Provider.of<MyTheme>(context, listen: false)
                      .setThemeValue(value);
                }),
            title: Text(
              "Theme",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
          ),
          ListTile(
            trailing: Text(
              "1.0.0",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            title: Text(
              "App Version",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
