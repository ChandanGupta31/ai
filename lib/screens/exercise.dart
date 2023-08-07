import 'dart:convert';

import 'package:ai/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import '../widgets/exercise.dart';

class Exercise extends StatefulWidget {
  Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  String selectedExerciseName = 'biceps';
  var visibility = false;
  var list =[];
  var data;
  String selectedCurrType = 'muscle';
  var currType =[
    'cardio',
    'olympic_weightlifting',
    'plyometrics',
    'powerlifting',
    'strength',
    'muscle',
    'stretching',
    'strongman',
  ];
  var currExerciseName =[
    'abdominals',
    'abductors',
    'adductors',
    'biceps',
    'calves',
    'chest',
    'forearms',
    'glutes',
    'hamstrings',
    'lats',
    'lower_back',
    'middle_back',
    'neck',
    'quadriceps',
    'traps',
    'triceps'
  ];
  void getInformation()async{

    EasyLoading.show();
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/exercises?${selectedCurrType.toString()}=${selectedExerciseName.toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = await response.stream.bytesToString();
      data = jsonDecode(jsonData);
      list.clear();
      data.forEach((value){
        list.add(
          ExerciseModel(name: value['name'],
            type: value['type'],
            muscle: value['muscle'],
              difficulity: value['difficulty'],
            instruction: value['instructions'],
          )
        );
      });
      print(data);
      visibility = true;
      EasyLoading.dismiss();
      setState(() {

      });
    }
    else {
      EasyLoading.dismiss();
      EasyLoading.showToast(
        response.reasonPhrase.toString(),
        toastPosition: EasyLoadingToastPosition.bottom,
        duration: Duration(seconds: 1),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.01),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Theme.of(context).primaryColor],
              center: Alignment.center,
              radius: 1,
              tileMode: TileMode.mirror,
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: [
                  Text(
                    'Select Exercise Type :  ',
                    style: TextStyle(fontSize: 14),
                  ),
                  DropdownButton(
                    // Initial Value
                    value: selectedCurrType,
                    // Down Arrow Icon
                    icon: Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: currType.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(fontSize: 13),),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrType = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Row(
                children: [
                  Text(
                    'Select Exercise Name :  ',
                    style: TextStyle(fontSize: 14),
                  ),
                  DropdownButton(
                    // Initial Value
                    value: selectedExerciseName,
                    // Down Arrow Icon
                    icon: Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: currExerciseName.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(fontSize: 13),),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedExerciseName = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: getInformation,
                  child: Text(
                    'Execise Information',
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
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Visibility(
                  visible: visibility,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height*0.75,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 0.5,
                      ),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: list.length,
                      itemBuilder: (context, index){
                        return exerciseItem(context, list[index]);
                      },
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
