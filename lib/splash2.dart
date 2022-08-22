import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_13/home.dart';
import 'package:lottie/lottie.dart';

// ignore: use_key_in_widget_constructors
class Mysplash extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Mysplash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HOME())));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 50,
          width: 90,
          
            child:  Lottie.asset('assets/15.json', fit: BoxFit.cover),
            // Icon(
            //   Icons.account_circle_outlined,
            //   size: 120,
            //   color: Colors.white,
            // ),
          ),
        
      ),
    );
  }
}
