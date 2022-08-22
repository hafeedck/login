import 'package:flutter/material.dart';
import 'package:flutter_application_13/home.dart';
import 'package:flutter_application_13/login.dart';
import 'auth_service.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: const Text(
          'Create Account',
          style: TextStyle(color: Colors.blue, fontSize: 22),
        ),
        centerTitle: true,
          leading: IconButton(
                color: Colors.black,
                onPressed: () { Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LoginScreen()));},
                icon: const Icon(Icons.arrow_back))),
      
      body:SingleChildScrollView(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //const SizedBox(height: 10),
           // const Text('HELLO!',style: TextStyle(color: Colors.black, fontSize: 75,fontWeight: FontWeight.w600,),),
           Lottie.asset('assets/11.json', fit: BoxFit.cover),
            // const SizedBox(height: 20,),
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
                    hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 10.0,
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
              height: 30.0,
            ),
            MaterialButton(
              height: 50,
              minWidth: 150,
              onPressed: () async {
                final message = await AuthService().registration(
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
                      MaterialPageRoute(builder: (context) => const HOME()));
                }
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              color: Colors.indigoAccent[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
     ) );
  }
}
