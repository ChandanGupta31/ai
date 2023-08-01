import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget homeItem(BuildContext context, String path, String name) {

  void selectOption(){

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