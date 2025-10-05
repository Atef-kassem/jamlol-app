
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/config/routes/routes.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds:5), () {
      Navigator.pushReplacementNamed(context,RoutesName.firstIntroScreen);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
          child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Image.asset(
                    "assets/images/bubbles.png",
                    fit: BoxFit.cover,
                    width: 300.w,
                    height: 280.h,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Image.asset(
                    "assets/images/splash_logo.png",
                    width: 280.w,
                    height: 80.h,
                  ),
                ),
              ]),
        ));
  }
}
