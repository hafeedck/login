import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_13/googlesignin.dart';
import 'package:flutter_application_13/home.dart';
import 'package:flutter_application_13/login.dart';
import 'package:lottie/lottie.dart';

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  Auth authClass = Auth();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 4750), () => _navigateUser());
  }

  void _navigateUser() async {
    String? token = await authClass.getToken();

    if (token != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HOME()));

      //Navigator.pushReplacementNamed(context, loginscreen);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 50,
          width: 90,

          child: Lottie.asset('assets/15.json', fit: BoxFit.cover),
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
