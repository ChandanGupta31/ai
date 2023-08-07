
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/recipe.dart';

Widget recipeItem(BuildContext context, RecipeModel data){
  void copyText() {
    Clipboard.setData(ClipboardData(text: data.instruction.toString()));
    EasyLoading.showToast(
    'Instruction Copied !',
    toastPosition: EasyLoadingToastPosition.bottom,
    duration: Duration(seconds: 1),
    );
  }
  return Container(
    margin: EdgeInsets.only(
      bottom: 15,
      right: 5,
    ),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          spreadRadius: -1,
          offset: Offset(3, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title: ${data.title}',
            maxLines: 300,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'ingredients : ${data.ingredients}',
          maxLines: 300,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Servings : ${data.servings}',
          maxLines: 300,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Instruction : ${data.instruction}',
          maxLines: 300,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: copyText,
            child: Text(
              'Copy Instruction',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        ),
      ],
    ),
  );
}
