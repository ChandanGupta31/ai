import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class QRGenerator extends StatefulWidget {
  QRGenerator({super.key});

  @override
  State<QRGenerator> createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {

  Future<void> getQR() async {
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/qrcode?format=png&data=https://api-ninjas.com'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }

  @override
  Widget build(BuildContext context) {
    var urlForQr = TextEditingController();
    var visibility =false;
    var textController = TextEditingController();
    var buttonName = 'Generate QR';
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
                controller: urlForQr,
                minLines: 1,
                maxLines: 10,
                keyboardType: TextInputType.url,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text('Past Url'),
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
                  onPressed: getQR,
                  child: Text(
                    buttonName,
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
            ],
          ),
        ),
      ),
    );;
  }
}
