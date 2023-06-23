import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // Provider.of<User>(context).user["userName"],
          "Comments",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: Center(child: Text('Comments Page')),
    );
  }
}
