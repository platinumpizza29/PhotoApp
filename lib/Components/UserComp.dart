// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

class UserComp extends StatefulWidget {
  const UserComp({super.key});

  @override
  State<UserComp> createState() => _UserCompState();
}

class _UserCompState extends State<UserComp> {
  var imageList = [];

  Future<void> getImages() async {
    var uri = dotenv.env["GET_USER_IMAGES"];
    var response = await Dio().get(uri!);
    setState(() {
      imageList = response.data;
    });
    print(imageList);
  }

  @override
  void initState() {
    getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 60,
                  foregroundImage: AssetImage("images/man.png"),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Keyur Bilgi",
                  style: GoogleFonts.poppins(fontSize: 27),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10, // Spacing between columns
                mainAxisSpacing: 10, // Spacing between rows
              ),
              itemCount: imageList.length, // Number of items in the grid
              itemBuilder: (BuildContext context, int index) {
                // Build the individual grid items
                return Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
