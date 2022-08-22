import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_application_13/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_13/splash2.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? MyHomePage() : Mysplash()));
      
}
