import 'package:dant/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF222831),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Color(0xFFFFD369)),
          onPressed: () => Get.toNamed(RouteName.home),
        ),
        title: Text(
          "About Me",
          style: GoogleFonts.poppins(
            color: Color(0xFFFFD369),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/img/ian.png",
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Daniel Ian Kurniawan",
              style: GoogleFonts.poppins(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                  "Hello world! My name is Daniel Ian Kurniawan and I'm a Computer Science Student in Bina Nusantara University (2022). This is my first Mobile Application project during Sanbercode Flutter Bootcamp. This project consist of Todo/Task application made with Flutter and Firebase/Firestore.",
                  style: GoogleFonts.poppins()),
            ),
          ],
        ),
      ),
    );
  }
}
