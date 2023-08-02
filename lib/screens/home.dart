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
          maxCrossAxisExtent: 250,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: MediaQuery.of(context).size.width<420 ? 0.92 : 1,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
          children: [
            homeItem(context, 'assets/images/image_to_text.png', 'Image to Text'),
            homeItem(context, 'assets/images/random_image.png', 'Random Image'),
            homeItem(context, 'assets/images/password_generator.png', 'Password Generator'),
            homeItem(context, 'assets/images/qr_generator.png', 'QR Generator'),
            homeItem(context, 'assets/images/dictionary.png', 'Dictionary'),
            homeItem(context, 'assets/images/thesaurus.png', 'Thesaurus'),
            homeItem(context, 'assets/images/quotes.png', 'Quotes'),
            homeItem(context, 'assets/images/jokes.png', 'Jokes'),
            homeItem(context, 'assets/images/exercises.png', 'Exercises'),
            homeItem(context, 'assets/images/recipe.png', 'Recipes'),
            homeItem(context, 'assets/images/currency_converter.png', 'Currency Converter'),
            homeItem(context, 'assets/images/country_api.png', 'About Country'),
            homeItem(context, 'assets/images/animals.png', 'Animals'),
            homeItem(context, 'assets/images/celebrity.png', 'Celebrity'),
            homeItem(context, 'assets/images/text_similarity.png', 'Text Similarity'),
            homeItem(context, 'assets/images/validate_phone.png', 'Validate Phone'),
          ],
        )
      ),
    );
  }
}
