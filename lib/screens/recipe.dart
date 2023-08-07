import 'dart:convert';

import 'package:ai/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import '../widgets/recipe.dart';

class Recipe extends StatefulWidget {
  Recipe({super.key});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  var recipeName = TextEditingController();
  var  visibility = false;
  var data;
  var list=[];
  void getInformation()async{
    EasyLoading.show();
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/recipe?query=${recipeName.text.toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = await response.stream.bytesToString();
      data = jsonDecode(jsonData);
       list.clear();
       data.forEach((value){
         list.add(
           RecipeModel(title: value['title'],
               ingredients: value['ingredients'],
               servings: value['servings'],
               instruction: value['instructions'],
           )
         );
       });
      print(data);
      visibility = true;
      EasyLoading.dismiss();
      setState(() {});
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
                controller: recipeName,
                keyboardType: TextInputType.name,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text('Enter Recipe Name'),
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
                  onPressed: getInformation,
                  child: Text(
                    'Recipe  Information',
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
                        return recipeItem(context, list[index]);
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
