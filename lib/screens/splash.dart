import 'package:ai/services/shared_preference.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState()  {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      var status = await AppManager.isLoggedIn();
      if(status){
        Navigator.pushReplacementNamed(context, 'home');
      }
      else{
        Navigator.pushReplacementNamed(context, 'login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
