import 'package:ai/widgets/home.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.extent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.92,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
          children: [
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
            homeItem(context, 'assets/images/card_payment.jpg', 'Image to Text'),
          ],
        )
      ),
    );
  }
}
