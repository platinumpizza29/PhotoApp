import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikesComp extends StatefulWidget {
  const LikesComp({super.key});

  @override
  State<LikesComp> createState() => _LikesCompState();
}

class _LikesCompState extends State<LikesComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Likes",
          style: GoogleFonts.poppins(fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
