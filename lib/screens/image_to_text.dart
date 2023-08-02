import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';


class ImageToText extends StatefulWidget {
  ImageToText({super.key});

  @override
  State<ImageToText> createState() => _ImageToTextState();
}

class _ImageToTextState extends State<ImageToText> {

  var path;
  var imageFile;
  var text = '';
  var textVisibility = false;
  var buttonName = 'Select Image';
  var textController = TextEditingController();
  
  void pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      buttonName = 'Get Text';
      path = image.path.toString();
      imageFile = File(image.path);
      setState(() {

      });
    } else {
      EasyLoading.showToast(
        'Please Select an Image',
        toastPosition: EasyLoadingToastPosition.center,
        duration: Duration(seconds: 1),
      );
    }
  }

  void getText() async {
    EasyLoading.show(status: 'Scanning Text ...');
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://api.api-ninjas.com/v1/imagetotext'));
    request.files.add(await http.MultipartFile.fromPath('image', path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var dataJSON = await response.stream.bytesToString();
      var data = jsonDecode(dataJSON);
      data.forEach((item) => {
        text += '${item['text']} ',
        print(item['text']),
      });
      EasyLoading.dismiss();
      setState(() {
        textVisibility = true;
        textController.text = text;
      });
    }
    else {
      EasyLoading.dismiss();
      EasyLoading.showToast(
        response.reasonPhrase.toString(),
        toastPosition: EasyLoadingToastPosition.center,
        duration: Duration(seconds: 1),
      );
      print(response.reasonPhrase);
    }
  }

  void copyText() {
    Clipboard.setData(ClipboardData(text: text));
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
          vertical: MediaQuery.of(context).size.height*0.01,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Theme.of(context).primaryColor],
            center: Alignment.center,
            radius: 1,
            tileMode: TileMode.mirror,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.2,
                child: path==null ? Image.asset('assets/images/image.png', fit: BoxFit.cover,) : Image.file(imageFile),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.025,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: ElevatedButton(
                    onPressed: (){
                      buttonName == 'Select Image' ? pickImageFromGallery() : getText();
                    },
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
              SizedBox(
                height: MediaQuery.of(context).size.height*0.025,
              ),
              Visibility(
                visible: textVisibility,
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
                visible: textVisibility,
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
