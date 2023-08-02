import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingServices{

  static void initialize(){
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.rotatingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 50
      ..radius = 10
      ..progressColor = Color(0xFFD0BCFF)
      ..backgroundColor = Colors.white
      ..indicatorColor = Color(0xFFD0BCFF)
      ..textColor = Color(0xFFD0BCFF)
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

}