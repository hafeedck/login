import 'package:flutter/material.dart';
import 'package:flutter_application_13/auth.dart';
import 'package:flutter_application_13/home.dart';
import 'package:flutter_application_13/splash2.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:text_editing_watcher/text_editing_watcher.dart';
import 'auth_service.dart';
import 'package:flutter_application_13/googlesignin.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Auth authClass = Auth();
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     checkLogin();
  //   });
  //   // authClass.signOut();
  // }

  // checkLogin() async {
    
  //   String? token = await authClass.getToken();
    
  //   if (token != null) {
  //      // ignore: use_build_context_synchronously
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) =>  Mysplash()));
  //   }
    
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: const Text(
            'Login',
            style: TextStyle(color: Colors.blue, fontSize: 22),
          ),
          centerTitle: true,
          leading: IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: const Icon(Icons.cyclone_rounded))),
      body:SingleChildScrollView(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 200,
              width: 400,
                child: Lottie.asset('assets/11.json', fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 17.0,
            ),
            TextEditingWatcher(
              controller: _emailController,
              builder: (text) => MaterialButton(
                height: 50,
                minWidth: 150,
                onPressed: text.isNotEmpty
                    ? () async {
                        final message = await AuthService().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        if (message!.contains('Success')) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString(
                              'email', _emailController.text.toString());
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HOME(),
                            ),
                          );
                        }
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      }
                    : null,
                color: Colors.indigoAccent[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateAccount(),
                  ),
                );
              },
              child: const Text("Don't have an account? Create Account"),
            ),
             const SizedBox(
              height: 1.0,
            ),
            InkWell(
                child: Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 1.6,
                    margin: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                scale: 50.0,
                                image: AssetImage('assets/1.jpg'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Text(
                          'Sign in with Google',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ))),
                onTap: () {
                  authClass.googleSignIn(context);
                }),
          ],
        ),
      ),
     ) );
  }
}
