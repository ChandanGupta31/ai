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
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.05,
          vertical: MediaQuery.of(context).size.height*0.01,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Theme.of(context).primaryColor],
            center: Alignment.center,
            radius: 1,
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
