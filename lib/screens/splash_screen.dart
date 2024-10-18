import 'dart:async';

import 'package:deshii_mart/screens/welcome_screen.dart';
import 'package:deshii_mart/styling/appcolors.dart';
import 'package:deshii_mart/styling/textsize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightgreens,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'DESHI MART',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: AppTextSize.headingFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
