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
import 'package:ai/screens/splash.dart';
import 'package:ai/screens/text_similarity.dart';
import 'package:ai/screens/thesaurus.dart';
import 'package:ai/screens/validate_phone.dart';
import 'package:ai/services/easyloading.dart';
import 'package:ai/services/firebase.dart';
import 'package:ai/services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await AppManager.isLoggedIn();

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    initialRoute: isLoggedIn ? 'home' : 'login',

    routes: {
      'splash' : (context) => Splash(),                             // Completed
      'login' : (context) => Login(),                               // Completed
      'signup' : (context) => SignUp(),                             // Completed
      'home' : (context) => Home(),                                 // Completed
      'image_to_text' : (context) => ImageToText(),                 // Completed
      'random_image' : (context) => RandomImage(),                  // Completed
      'password_generator' : (context) => PasswordGenerator(),      // Completed
      'qr_generator' : (context) => QRGenerator(),                  // Completed
      'dictionary' : (context) => Dictionary(),
      'thesaurus' : (context) => Thesaurus(),
      'quotes' : (context) => Quotes(),                             // Completed
      'jokes' : (context) => Jokes(),
      'exercise' : (context) => Exercise(),
      'recipe' : (context) => Recipe(),
      'currency_convertor' : (context) => CurrencyConvertor(),      // Completed
      'about_country' : (context) => AboutCountry(),                // Completed
      'animal' : (context) => Animal(),
      'celebrity' : (context) => Celebrity(),                       // Completed
      'text_similarity' : (context) => TextSimilarity(),            // Completed
      'validate_phone' : (context) => ValidatePhone(),              // Completed
    },

    theme: ThemeData(
      fontFamily: 'Poppins',
      primaryColor: Color(0xFFD0BCFF),
    ),

    builder: EasyLoading.init(),
  ));

  FirebaseService.initialize();
  EasyLoadingServices.initialize();
}