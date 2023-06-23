// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:photoapp/Pages/HomePage.dart';
import 'package:photoapp/Pages/LoginPage.dart';
import 'package:photoapp/services/UserAuth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                color: Color(0xFF0C1D2E),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Sign up",
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _userName,
                decoration: InputDecoration(
                  suffixIcon: LineIcon.user(),
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  suffixIcon: LineIcon.at(),
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: LineIcon.lock(),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(fontSize: 15),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40)),
                  onPressed: () async {
                    var status = await UserAuth().registerUser(
                        context, _userName.text, _email.text, _password.text);
                    if (status == "Error") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Error while registering"),
                        backgroundColor: CupertinoColors.destructiveRed,
                      ));
                    } else {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => HomePage()));
                    }
                  },
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                color: Color(0xFFD3D8DB),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    icon: LineIcon.googleLogo(),
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 2.5, 40)),
                    onPressed: () {},
                    label: Text(
                      "Google",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      icon: LineIcon.facebook(),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width / 2.5, 40)),
                      onPressed: () {},
                      label: Text(
                        "Facebook",
                        style: GoogleFonts.poppins(),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Click here to login."))
          ],
        ),
      ),
    );
  }
}
