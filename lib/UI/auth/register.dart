import 'package:dant/routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393E46),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/logo.png",
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 20),
              Text(
                "Create Account",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFEEEEEE),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Enter your email",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Enter your password",
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFD369),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () async {
                    await _firebaseAuth
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then((value) => Get.toNamed(RouteName.home));
                  },
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF222831),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteName.login);
                },
                child: Text(
                  "Already have an account?",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFFFD369),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
