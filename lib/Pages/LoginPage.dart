// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:photoapp/Pages/RegisterPage.dart';
import 'package:photoapp/services/UserAuth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
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
                    child: Text("Sign in into your account",
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
                  onPressed: () => UserAuth().loginWithEmailAndPassword(
                      context, _email.text, _password.text),
                  child: Text(
                    "Login",
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
                      CupertinoPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text("Click here to register."))
          ],
        ),
      ),
    );
  }
}
