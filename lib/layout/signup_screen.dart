// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
//   late String name, email, password;
//   late bool _passwordVisible, _isLoading;
//   var validator;
//
//   // ignore: must_call_super
//   void initState() {
//     _passwordVisible = false;
//     _isLoading = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.blue[700],
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 behavior: HitTestBehavior.opaque,
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 65),
//                   child: Center(
//                     child: Container(
//                       height: 48,
//                       width: 48,
//                       decoration: BoxDecoration(
//                         color: Colors.orange,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: 15,
//                   bottom: 15,
//                   right: MediaQuery.of(context).size.width * 0.15,
//                   left: MediaQuery.of(context).size.width * 0.15,
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Welcome",
//                     style: GoogleFonts.sourceCodePro(
//                       fontSize: 50,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   right: MediaQuery.of(context).size.width * 0.12,
//                   left: MediaQuery.of(context).size.width * 0.12,
//                 ),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * 0.66,
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   decoration: BoxDecoration(
//                     color: Colors.blue[700],
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       top: 28,
//                     ),
//                     child: Form(
//                       key: _formKey1,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(
//                               bottom: 18,
//                             ),
//                             child: Text(
//                               "Sign Up",
//                               style: GoogleFonts.sourceCodePro(
//                                 fontSize: 26,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: 18,
//                               right: 18,
//                             ),
//                             child: Card(
//                               shadowColor: Colors.black87,
//                               elevation: 5,
//                               color: Colors.orange,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20.0)),
//                               child: TextFormField(
//                                 cursorColor: Colors.white,
//                                 cursorHeight: 20,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: "Enter Your Name",
//                                   hintStyle: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w400,
//                                     letterSpacing: 1.1,
//                                   ),
//                                   labelText: "Name",
//                                   labelStyle: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                 ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     name = value;
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (value!.isEmpty || value.length < 4) {
//                                     return 'invalid';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//
// //second form field
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: 18,
//                               right: 18,
//                             ),
//                             child: Card(
//                               shadowColor: Colors.black87,
//                               elevation: 5,
//                               color: Colors.orange,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20.0)),
//                               child: TextFormField(
//                                 cursorColor: Colors.white,
//                                 cursorHeight: 20,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: "Enter Your e-mail",
//                                   hintStyle: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w400,
//                                     letterSpacing: 1.1,
//                                   ),
//                                   labelText: "E-mail",
//                                   labelStyle: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                 ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     name = value;
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (value!.isEmpty ||
//                                       !value.contains('@gmail')) {
//                                     return 'invalid E-mail';
//                                   }
//                                   return null;
//                                 },
//                                 onSaved: (value) {
//                                   //_authData['email'] = value;
//                                 },
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//
//                           //third for,,,,,,,,,,,
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: 18,
//                               right: 18,
//                             ),
//                             child: Card(
//                               shadowColor: Colors.black87,
//                               elevation: 5,
//                               color: Colors.orange,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20.0)),
//                               child: TextFormField(
//                                 cursorColor: Colors.white,
//                                 cursorHeight: 20,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 obscureText: !_passwordVisible,
//                                 decoration: InputDecoration(
//                                   suffixIcon: GestureDetector(
//                                     onTap: () {
//                                       setState(
//                                         () {
//                                           _passwordVisible = !_passwordVisible;
//                                         },
//                                       );
//                                     },
//                                     child: Icon(!_passwordVisible
//                                         ? Icons.visibility
//                                         : Icons.visibility_off),
//                                   ),
//                                   hintText: "Enter Password",
//                                   hintStyle: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w400,
//                                     letterSpacing: 1.1,
//                                   ),
//                                   labelText: "Password",
//                                   labelStyle: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                 ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     name = value;
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return 'invalid';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//
//                           //fourthsssssssssssssssssssssssssssss
//
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: 18,
//                               right: 18,
//                             ),
//                             child: Card(
//                               shadowColor: Colors.black87,
//                               elevation: 5,
//                               color: Colors.orange,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20.0)),
//                               child: TextFormField(
//                                 cursorColor: Colors.white,
//                                 cursorHeight: 20,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: "Enter Your Number",
//                                   hintStyle: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w400,
//                                     letterSpacing: 1.1,
//                                   ),
//                                   labelText: "Mobile Number",
//                                   labelStyle: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                 ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     name = value;
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return 'invalid';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//
//                           GestureDetector(
//                             behavior: HitTestBehavior.opaque,
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                 top: 20,
//                               ),
//                               child: Container(
//                                 height: 48,
//                                 width: 48,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                     )
//                                   ],
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: _isLoading
//                                     ? SpinKitDoubleBounce(
//                                         color: Colors.blue,
//                                       )
//                                     : Icon(
//                                         Icons.arrow_forward,
//                                         color: Colors.blue,
//                                       ),
//                               ),
//                             ),
//                             onTap: () {
//                               print("Checking credintials");
//                               setState(() {
//                                 _isLoading = true;
//                               });
//                             },
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
