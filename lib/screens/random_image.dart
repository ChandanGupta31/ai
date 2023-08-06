import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class RandomImage extends StatefulWidget {
  RandomImage({super.key});

  @override
  State<RandomImage> createState() => _RandomImageState();
}

class _RandomImageState extends State<RandomImage> {

  var visibility = false;
  var imageFile = '';
  var selectedCategory = 'Any';
  var category = [
    'Any',
    'Nature',
    'City',
    'Technology',
    'Food',
    'Abstract',
    'Wildlife',
  ];

  void getImage() async {
    EasyLoading.show();
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/randomimage?category=${selectedCategory == 'Any' ? '' : selectedCategory.toLowerCase()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      imageFile = await response.stream.bytesToString();
      visibility = true;
      print('Success');
      EasyLoading.dismiss();
      setState(() {

      });
    }
    else {
      EasyLoading.dismiss();
      EasyLoading.showToast(
        response.reasonPhrase.toString(),
        toastPosition: EasyLoadingToastPosition.center,
        duration: Duration(seconds: 1),
      );
    }
  }

  void downloadImage() async {
    try {
      final galleryDirectory = await getExternalStorageDirectory();
      final file = File('${galleryDirectory!.path}/${DateTime.now()}.png');
      await file.writeAsBytes(base64Decode(imageFile));
      await ImageGallerySaver.saveFile(file.path);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image saved to gallery'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
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
              Row(
                children: [
                  Text(
                    'Category : ',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.1,
                  ),
                  DropdownButton(
                    value: selectedCategory,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: category.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(fontSize: 15),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: ElevatedButton(
                  onPressed: getImage,
                  child: Text(
                    'Get Image',
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
                child: Image.memory(
                  base64Decode(imageFile),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.height*0.3,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Visibility(
                visible: visibility,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: ElevatedButton(
                    onPressed: downloadImage,
                    child: Text(
                      'Download Image',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
