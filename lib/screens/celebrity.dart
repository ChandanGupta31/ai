import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class Celebrity extends StatefulWidget {
  Celebrity({super.key});

  @override
  State<Celebrity> createState() => _CelebrityState();
}

class _CelebrityState extends State<Celebrity> {
  var celebrityName = TextEditingController();
  var visibility = false;
  var data;
  var name = '';
  var netWorth = '';
  var gender = '';
  var nationality = '';
  var occupation = '';
  var height = '';
  var birthday = '';
  var age = '';
  var isAlive = '';
  void getInformation()async{
   EasyLoading.show();
  var headers = {
    'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
  };
  var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/celebrity?name=${celebrityName.text.toString()}'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var jsonData = await response.stream.bytesToString();
    data = jsonDecode(jsonData);
    name = data[0]['name'];
    netWorth = data[0]['net_worth'].toString();
    gender = data[0]['gender'];
    nationality = data[0]['nationality'];
    occupation = data[0]['occupation'][0].toString();
    height = data[0]['height'].toString();
    birthday = data[0]['birthday'];
    age = data[0]['age'].toString();
    isAlive = data[0]['is_alive'].toString();

    visibility = true;
    print(data);
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
                controller: celebrityName,
                keyboardType: TextInputType.name,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text('Enter Celebrity Name'),
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
                        Text(
                          'Name : ${name}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Net Worth : ${netWorth}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Gender : ${gender}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Nationality : ${nationality}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Occupation : ${occupation}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Height : ${height}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'BirthDay : ${birthday}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Age : ${age}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Alive : ${isAlive}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
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
