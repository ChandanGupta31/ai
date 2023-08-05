import 'package:ai/models/celebrity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget celebrityItem(BuildContext context, CelebrityModel data){
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
          'Name : ${data.name}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Net Worth : ${data.netWorth}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Gender : ${data.gender}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Nationality : ${data.nationality}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Occupation : ${data.occupation}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Height : ${data.height}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Birthday : ${data.birthday}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Age : ${data.age}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}