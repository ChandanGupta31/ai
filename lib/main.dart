import 'package:ai/screens/about_country.dart';
import 'package:ai/screens/animals.dart';
import 'package:ai/screens/celebrity.dart';
import 'package:ai/screens/currency_convertor.dart';
import 'package:ai/screens/dictionary.dart';
import 'package:ai/screens/exercise.dart';
import 'package:ai/screens/home.dart';
import 'package:ai/screens/image_to_text.dart';
import 'package:ai/screens/jokes.dart';
import 'package:ai/screens/login.dart';
import 'package:ai/screens/password_generator.dart';
import 'package:ai/screens/qr_generator.dart';
import 'package:ai/screens/quotes.dart';
import 'package:ai/screens/random_image.dart';
import 'package:ai/screens/recipe.dart';
import 'package:ai/screens/sign_up.dart';
import 'package:ai/screens/text_similarity.dart';
import 'package:ai/screens/thesaurus.dart';
import 'package:ai/screens/validate_phone.dart';
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
      'image_to_text' : (context) => ImageToText(),
      'random_image' : (context) => RandomImage(),
      'password_generator' : (context) => PasswordGenerator(),
      'qr_generator' : (context) => QRGenerator(),
      'dictionary' : (context) => Dictionary(),
      'thesaurus' : (context) => Thesaurus(),
      'quotes' : (context) => Quotes(),
      'jokes' : (context) => Jokes(),
      'exercise' : (context) => Exercise(),
      'recipe' : (context) => Recipe(),
      'currency_convertor' : (context) => CurrencyConvertor(),
      'about_country' : (context) => AboutCountry(),
      'animal' : (context) => Animal(),
      'celebrity' : (context) => Celebrity(),
      'text_similarity' : (context) => TextSimilarity(),
      'validate_phone' : (context) => ValidatePhone(),
    },

    theme: ThemeData(
      fontFamily: 'Poppins',
      primaryColor: Color(0xFFD0BCFF),
    ),
  ));

  FirebaseService.initialize();
}

