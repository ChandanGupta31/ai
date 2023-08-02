import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class PasswordGenerator extends StatefulWidget {
  PasswordGenerator({super.key});

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {

  var passwordSize = TextEditingController();
  var visibility = false;
  var textController = TextEditingController();
  var data;

  void getPassword() async {
    EasyLoading.show();
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/passwordgenerator?length=${passwordSize.text..toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var dataJson = await response.stream.bytesToString();
      var item = jsonDecode(dataJson);
      data = item['random_password'];
      visibility = true;
      textController.text = data;
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

  void copyText() {
    Clipboard.setData(ClipboardData(text: data));
    EasyLoading.showToast(
      'Text Copied !',
      toastPosition: EasyLoadingToastPosition.bottom,
      duration: Duration(seconds: 1),
    );
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
                controller: passwordSize,
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text('Password Size'),
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
                  onPressed: getPassword,
                  child: Text(
                    'Generate Password',
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
                  child: TextFormField(
                    controller: textController,
                    minLines: 1,
                    maxLines: 300,
                    enabled: false,
                    decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 0.5,
                            )
                        )
                    ),
                  )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.025,
              ),
              Visibility(
                visible: visibility,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: ElevatedButton(
                    onPressed: copyText,
                    child: Text(
                      'Copy Text',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
