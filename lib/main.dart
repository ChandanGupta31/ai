import 'package:ai/screens/home.dart';
import 'package:ai/services/firebase.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    initialRoute: 'home',

    routes: {
      'home' : (context) => Home(),
    },

    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
  ));

  FirebaseService.initialize();
}

