import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
class Animal extends StatefulWidget {
  Animal({super.key});

  @override
  State<Animal> createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  var animalName = TextEditingController();
  var visibility = false;
  var data;

  var name ='';
  var taxonomy = ' ';
  var kingdom = ' ';
  var phylum =' ';
  var clas = ' ';
  var order = ' ';
  var family = ' ';
  var genus = ' ';
  var scientific_name =' ';
  var  locations =' ';
  var characteristics = ' ';
  var prey = ' ';
  var name_of_young = ' ';
  var group_behavior = ' ';
  var estimated_population_size =' ';
  var biggest_threat = ' ';
  var most_distinctive_feature = ' ';
  var gestation_period = ' ';
  var habitat = ' ';
  var diet = ' ';
  var average_litter_size = ' ';
  var lifestyle = ' ';
  var common_name = ' ';
  var number_of_species = ' ';
  var location =' ';
  var slogan= ' ';
  var group =' ';
  var color = ' ';
  var skin_type =' ';
  var top_speed =' ';
  var lifespan = ' ';
  var weight =' ';
  var height = ' ';
  var age_of_sexual_maturity =' ';
  var age_of_weaning =' ';

  void getInformation()async{
    EasyLoading.show();
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/animals?name=${animalName.text.toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      var jsonData = await response.stream.bytesToString();
      data = jsonDecode(jsonData);
      name = data[0]['name'];
      kingdom = data[0]['taxonomy']['kingdom'];
      phylum =data[0]['taxonomy']['phylum'];
      clas = data[0]['taxonomy']['class'];
      order = data[0]['taxonomy']['order'];
      family =data[0]['taxonomy']['family'];
      genus = data[0]['taxonomy']['genus'];
      scientific_name =data[0]['taxonomy']['scientific_name'];
      //locations =data['locations '];
      prey = data[0]['characteristics']['prey'];
      name_of_young = data[0]['characteristics']['name_of_young'];
      group_behavior = data[0]['characteristics']['group_behavior'];
      estimated_population_size =data[0]['characteristics']['estimated_population_size'];
      biggest_threat = data[0]['characteristics']['biggest_threat'];
      most_distinctive_feature = data[0]['characteristics']['most_distinctive_feature'];
      gestation_period = data[0]['characteristics']['gestation_period'];
      habitat = data[0]['characteristics']['habitat'];
      diet = data[0]['characteristics']['diet'];
      average_litter_size = data[0]['characteristics']['average_litter_size'];
      lifestyle = data[0]['characteristics']['lifestyle'];
      common_name = data[0]['characteristics']['common_name'];
      number_of_species = data[0]['characteristics']['number_of_species'];
      location =data[0]['characteristics']['location'];
      slogan= data[0]['characteristics']['slogan'];
      group =data[0]['characteristics']['group'];
      color = data[0]['characteristics']['color'];
      skin_type =data[0]['characteristics']['skin_type'];
      top_speed =data[0]['characteristics']['top_speed'];
      lifespan = data[0]['characteristics']['lifespan'];
      weight =data[0]['characteristics']['weight'];
      height = data[0]['characteristics']['height'];
      age_of_sexual_maturity =data[0]['characteristics']['age_of_sexual_maturity'];
      age_of_weaning =data[0]['characteristics']['age_of_weaning'];
      visibility = true;
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
            horizontal: MediaQuery.of(context).size.width*0.05,
            vertical: MediaQuery.of(context).size.height*0.01
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Theme.of(context).primaryColor],
              center: Alignment.center,
              radius: 1,
              tileMode: TileMode.mirror,
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              TextField(
                controller: animalName,
                keyboardType: TextInputType.name,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text('Enter Animal Name'),
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
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: ElevatedButton(
                  onPressed: getInformation,
                  child: Text(
                    'Get  Information',
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
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              Visibility(
                  visible: visibility,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name : ${name}', style: TextStyle(fontSize: 14,),),
                        Text('Kingdom : ${kingdom}', style: TextStyle(fontSize: 14,),),
                        Text('Phylum : ${phylum}', style: TextStyle(fontSize: 14,),),
                        Text('class : ${clas}', style: TextStyle(fontSize: 14,),),
                        Text('Order : ${order}', style: TextStyle(fontSize: 14,),),
                        Text('Family : ${family}', style: TextStyle(fontSize: 14,),),
                        Text('Genus : ${genus}', style: TextStyle(fontSize: 14,),),
                        Text('Scientific Name: ${scientific_name}', style: TextStyle(fontSize: 14,),),
                        Text('prey : ${prey}', style: TextStyle(fontSize: 14,),),
                        Text('Name of Youth : ${name_of_young}', style: TextStyle(fontSize: 14,),),
                        Text('Group Behavior : ${group_behavior}', style: TextStyle(fontSize: 14,),),
                        Text('Estimated population : ${estimated_population_size}', style: TextStyle(fontSize: 14,),),
                        Text('Bigger Threat : ${biggest_threat}', style: TextStyle(fontSize: 14,),),
                        Text('Distinctive Feature: ${most_distinctive_feature}', style: TextStyle(fontSize: 14,),),
                        Text('Gestation Period : ${gestation_period}', style: TextStyle(fontSize: 14,),),
                        Text('Habitat : ${habitat}', style: TextStyle(fontSize: 14,),),
                        Text('Diet : ${diet}', style: TextStyle(fontSize: 14,),),
                        Text('Average Litter Size : ${average_litter_size}', style: TextStyle(fontSize: 14,),),
                        Text('Lifestyle : ${lifestyle}', style: TextStyle(fontSize: 14,),),
                        Text('slogan : ${slogan}', style: TextStyle(fontSize: 14,),),
                        Text('Group : ${group}', style: TextStyle(fontSize: 14,),),
                        Text('Color : ${color}', style: TextStyle(fontSize: 14,),),
                        Text('Skin Type: ${skin_type}', style: TextStyle(fontSize: 14,),),
                        Text('Top Speed : ${top_speed}', style: TextStyle(fontSize: 14,),),
                        Text('Lifespan : ${lifespan}', style: TextStyle(fontSize: 14,),),
                        Text('Weight: ${weight}', style: TextStyle(fontSize: 14,),),
                        Text('Height : ${height}', style: TextStyle(fontSize: 14,),),
                        Text('Age Of Sex Maturity : ${age_of_sexual_maturity}', style: TextStyle(fontSize: 14,),),
                        Text('Age of Weaning: ${age_of_weaning}', style: TextStyle(fontSize: 14,),),

                      ],
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
