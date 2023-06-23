import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageDetails extends StatefulWidget {
  const ImageDetails({super.key, required this.image, this.user});
  final user;
  final image;

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/ 2,
            width: double.infinity,
            child: Image.network(widget.image,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.user,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 27),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
