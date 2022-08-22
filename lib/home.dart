// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_13/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_13/googlesignin.dart';


class HOME extends StatefulWidget {
  const HOME({Key? key}) : super(key: key);

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  // ignore: override_on_non_overriding_member
  Auth authClass = Auth();
  // ignore: annotate_overrides

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'welcome',
            style: TextStyle(fontSize: 22),
          ),
        ),
        MaterialButton(
          height: 50,
          minWidth: 200,
          onPressed: () {
            show();
          },
          color: Colors.indigoAccent[400],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: const Text(
            "sign out",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        )
      ],
    ));
  }

  show() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Do you want to Logout?'),
        actions: [
       
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () async {
                    try {
                      await authClass.signOut();
                      await FirebaseAuth.instance.signOut();

                      Navigator.pop(context, true);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                  },
                  child: const Text('Yes'))
            ],
          ),
        
      
    );
  }
}
