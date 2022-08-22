// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class mysecondpage extends StatefulWidget {
//   const mysecondpage({Key? key}) : super(key: key);

//   @override
//   State<mysecondpage> createState() => _mysecondpageState();
// }

// class _mysecondpageState extends State<mysecondpage> {
//   // final TextEditingController textEditingController = TextEditingController();
//   // final TextEditingController textEditingController1 = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             bottomOpacity: 0.0,
//             elevation: 0.0,
//             title: const Text(
//               'SALES TOP',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             leading: IconButton(
//                 color: Colors.black,
//                 onPressed: () {},
//                 icon: const Icon(Icons.cyclone_rounded))),
//         body: Container(
//           margin: const EdgeInsets.all(20),
//           // ignore: prefer_const_literals_to_create_immutables
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Welcome Back',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   margin: const EdgeInsets.only(left: 0),
//                   child: const Text('Sign in to continue',
//                       style: TextStyle(
//                         color: Colors.black,
//                       ))),
//               const SizedBox(
//                 height: 30,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Username",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black87),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   TextField(
//                    // controller: textEditingController,
//                     decoration: const InputDecoration(
//                       contentPadding:
//                           EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(),
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     "Password",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black87),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   TextField(
//                   //  controller: textEditingController1,
//                     decoration: const InputDecoration(
//                       contentPadding:
//                           EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(),
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 90),
//                     child: MaterialButton(
//                       height: 50,
//                       minWidth: 200,
//                       onPressed: () {
//                         // var f = textEditingController.text;
//                         // var j = textEditingController1.text;
//                       },
//                       color: Colors.indigoAccent[400],
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40)),
//                       child: const Text(
//                         "Login Now",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   GestureDetector(
//                     child: Container(
//                         margin: const EdgeInsets.only(left: 113),
//                         child: const Text(
//                           'Forgot Password?',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         )),
//                     onTap: () {
//                       Navigator.pop(context, 'guhyj');
//                       // Navigator.pushNamed(context, "myRoute");
//                     },
//                   ),
//                   SizedBox(height: 30,),
//                    Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const SizedBox(
//             width: 20,
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: const CircleAvatar(
//               backgroundColor: Colors.blue,
              
//               radius: 20,
//               backgroundImage: AssetImage(
//                 "image/facebooklogo.jpg",
//               ),
//             ),

            
//             //child: const Icon(Icons.facebook_rounded),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           GestureDetector(
//             //backgroundColor: Colors.blue,
//             child: const CircleAvatar(
//               radius: 20,
//               backgroundImage: AssetImage(
//                 "image/mail.png",
//               ),
//             ),
//             onTap: () {},
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           GestureDetector(
//            // backgroundColor: Colors.blue,
//             child: const CircleAvatar(
//               radius: 20,
//               backgroundImage: AssetImage(
//                 "image/LinkedIn.png",
//               ),
//             ),
//             onTap: () {},
//           ),
//                  const SizedBox(
//           height: 20,
//         ),
//         ],
//               ),
//             ],
//           ),
//           SizedBox(height:30),
//         Container(
//           margin: EdgeInsets.only(left: 80),
//           child: GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, "myRoute");
//               },
//               child: RichText(
//                   text: const TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "Don't have an account?",
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextSpan(
//                     text: "Sign up",
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ))),
//         )]),
//        ));
//   }
// }
