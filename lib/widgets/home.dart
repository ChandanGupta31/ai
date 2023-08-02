import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget homeItem(BuildContext context, String path, String name) {

  void selectOption(){
      switch(name){
        case 'Image to Text' :
          Navigator.pushNamed(context, 'image_to_text');
          break;
        case 'Random Image' :
          Navigator.pushNamed(context, 'random_image');
          break;
        case 'Password Generator' :
          Navigator.pushNamed(context, 'password_generator');
          break;
        case 'QR Generator' :
          Navigator.pushNamed(context, 'qr_generator');
          break;
        case 'Dictionary' :
          Navigator.pushNamed(context, 'dictionary');
          break;
        case 'Thesaurus' :
          Navigator.pushNamed(context, 'thesaurus');
          break;
        case 'Quotes' :
          Navigator.pushNamed(context, 'quotes');
          break;
        case 'Jokes' :
          Navigator.pushNamed(context, 'jokes');
          break;
        case 'Exercises' :
          Navigator.pushNamed(context, 'exercise');
          break;
        case 'Recipes' :
          Navigator.pushNamed(context, 'recipe');
          break;
        case 'Currency Converter' :
          Navigator.pushNamed(context, 'currency_convertor');
          break;
        case 'About Country' :
          Navigator.pushNamed(context, 'about_country');
          break;
        case 'Animals' :
          Navigator.pushNamed(context, 'animal');
          break;
        case 'Celebrity' :
          Navigator.pushNamed(context, 'celebrity');
          break;
        case 'Text Similarity' :
          Navigator.pushNamed(context, 'text_similarity');
          break;
        default :
          Navigator.pushNamed(context, 'validate_phone');
      }
  }

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade700,
          spreadRadius: -0.5,
          blurRadius: 5,
          offset: Offset(3, 3),
        ),
      ],
    ),
    child: InkWell(
      onTap: selectOption,
      child: Column(
        children: [
          SizedBox(
            height: 7,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              height: 115,
              width: 115,
              child: Image.asset(
                path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}