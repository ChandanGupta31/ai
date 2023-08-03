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
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.27,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.height*0.2,
                child: Image.asset(
                  'assets/images/icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Text(
              'AI Fusion',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            Spacer(),
            Text(
              'Version 1.0',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.015,
            ),
          ],
        ),
      ),
    );
  }
}
