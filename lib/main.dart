import 'package:ai/screens/home.dart';
import 'package:ai/screens/login.dart';
import 'package:ai/screens/sign_up.dart';
import 'package:ai/services/firebase.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    initialRoute: 'home',

    routes: {
      'signup' : (context) => SignUp(),
      'login' : (context) => Login(),
      'home' : (context) => Home(),

    },

    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
  ));

  FirebaseService.initialize();
}

