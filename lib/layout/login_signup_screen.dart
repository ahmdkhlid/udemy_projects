// import 'package:coffee_shop/utilites/slide_left_route.dart';
// import 'package:coffee_shop/utilites/slide_right_route.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'login_screen.dart';
// import 'signup_screen.dart';
//
// class LoginSignUpScreen extends StatefulWidget {
//   // LoginSignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
// }
//
// class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: 120,
//                   bottom: 22,
//                 ),
//                 child: Text(
//                   'Hello!',
//                   style: GoogleFonts.sourceCodePro(fontSize: 50),
//                 ),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     behavior: HitTestBehavior.opaque,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         SlideRightRoute(page: SignUpScreen()),
//                       );
//                     },
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.55,
//                       width: MediaQuery.of(context).size.width * 0.47,
//                       decoration: BoxDecoration(
//                         color: Colors.blue[700],
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20),
//                           bottomRight: Radius.circular(
//                             20,
//                           ),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                           right: 28,
//                           top: 28,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 bottom: 8,
//                               ),
//                               child: Text(
//                                 'Sign Up',
//                                 style: GoogleFonts.sourceCodePro(
//                                   color: Colors.white,
//                                   fontSize: 26,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 top: 8.0,
//                                 bottom: 8.0,
//                               ),
//                               child: Text(
//                                 'New Here?',
//                                 style: GoogleFonts.sourceCodePro(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "Don't worry, just Sign Up to gain access to our app",
//                               style: GoogleFonts.sourceCodePro(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.white,
//                               ),
//                               textAlign: TextAlign.right,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Spacer(
//                     flex: 1,
//                   ),
//                   SizedBox(
//                     width: 25,
//                   ),
//                   GestureDetector(
//                     behavior: HitTestBehavior.opaque,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         SlideLeftRoute(page: LoginScreen()),
//                       );
//                     },
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.5,
//                       width: MediaQuery.of(context).size.width * 0.43,
//                       decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(
//                               20,
//                             ),
//                             bottomLeft: Radius.circular(
//                               20,
//                             ),
//                           )),
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                           left: 22,
//                           right: 22,
//                           top: 28,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 bottom: 8,
//                               ),
//                               child: Text("Sign In",
//                                   style: GoogleFonts.sourceCodePro(
//                                       color: Colors.white,
//                                       fontSize: 26,
//                                       fontWeight: FontWeight.w500)),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 top: 8.0,
//                                 bottom: 8.0,
//                               ),
//                               child: Text(
//                                 "Returning?",
//                                 style: GoogleFonts.sourceCodePro(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 top: 8.0,
//                                 right: 8.0,
//                               ),
//                               child: Text(
//                                 "Just Sign in to resume what you were doing",
//                                 textAlign: TextAlign.left,
//                                 style: GoogleFonts.sourceCodePro(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 18.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                         right: 6.0,
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 48,
//                             width: 48,
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   offset: Offset(1, 0),
//                                 ),
//                               ],
//                               shape: BoxShape.circle,
//                             ),
//                             child: Center(
//                               child: FaIcon(
//                                 FontAwesomeIcons.google,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             height: 48,
//                             width: 48,
//                             decoration: BoxDecoration(
//                               color: Colors.deepPurpleAccent,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                 ),
//                               ],
//                               shape: BoxShape.circle,
//                             ),
//                             child: Center(
//                               child: FaIcon(
//                                 FontAwesomeIcons.twitter,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             height: 48,
//                             width: 48,
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                 ),
//                               ],
//                               shape: BoxShape.circle,
//                             ),
//                             child: Center(
//                               child: FaIcon(
//                                 FontAwesomeIcons.facebook,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
