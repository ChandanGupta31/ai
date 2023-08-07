import 'dart:convert';

import 'package:ai/models/jokes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import '../widgets/jokes.dart';

class Jokes extends StatefulWidget {
  Jokes({super.key});

  @override
  State<Jokes> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  var numberOfJokes = TextEditingController();
  var visibility = false;
  var list =[];
  var data;
  void getJokes()async{
   EasyLoading.show();
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/jokes?limit=${numberOfJokes.text.toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = await response.stream.bytesToString();
      data = jsonDecode(jsonData);
      print(data);
      list.clear();
      data.forEach((value){
        list.add(
         JokesModel(jokes: value['joke'])
        );
      });
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
              TextField(
                controller: numberOfJokes,
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text(' Number of Jokes Wants'),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: getJokes,
                  child: Text(
                    'Get Jokes',
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
                        return jokesItem(context, list[index]);
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
