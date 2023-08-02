import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class ValidatePhone extends StatefulWidget {
  ValidatePhone({super.key});

  @override
  State<ValidatePhone> createState() => _ValidatePhoneState();
}

class _ValidatePhoneState extends State<ValidatePhone> {

  var data;
  var valid;
  var country;
  var location;
  var timeZone;
  var visiblity = false;
  var phoneNo = TextEditingController();

  void verifyPhone() async {
    EasyLoading.show();
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/validatephone?number=${phoneNo.text.toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var dataJson = await response.stream.bytesToString();
      data = jsonDecode(dataJson);
      valid = data['is_valid'] ? 'Yes' : 'No';
      country = data['country'];
      location = data['location'];
      timeZone = data["timezones"][0];
      visiblity = true;
      EasyLoading.dismiss();
      print(data);
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
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              TextField(
                controller: phoneNo,
                keyboardType: TextInputType.phone,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text('Phone No.'),
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
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: ElevatedButton(
                  onPressed: verifyPhone,
                  child: Text(
                    'Verify Phone No.',
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
                visible: visiblity,
                  child:Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 0.5,
                        color: Theme.of(context).primaryColor,
                      )
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Valid : ${valid}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Country : ${country}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Location : ${location}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Time Zone : ${timeZone}',
                          style: TextStyle(
                            fontSize: 16,
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
