import 'dart:async';
import 'package:dant/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashScreenStart();
  }

  // ignore: non_constant_identifier_names
  SplashScreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Get.toNamed(RouteName.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD369),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/img/logo.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            Text(
              "Dant",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
