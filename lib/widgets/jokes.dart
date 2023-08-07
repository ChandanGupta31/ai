
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/jokes.dart';

Widget jokesItem(BuildContext context, JokesModel data){
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
          'Joke : ${data.jokes}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}