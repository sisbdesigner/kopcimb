import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopcimb/Dashboard.dart';
import 'package:kopcimb/ForgetPassword.dart';
import 'package:kopcimb/Login.dart';
import 'package:kopcimb/OTP.dart';
import 'package:kopcimb/Registration.dart';
import 'package:kopcimb/Welcome.dart';
import 'package:kopcimb/Splash.dart';
import 'package:kopcimb/test.dart';
import 'package:kopcimb/Upload.dart';

void main() {
  runApp(const MyApp());
  Fluttertoast.showToast;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home:  Splash(),
    );
  }
}


