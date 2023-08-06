import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Quotes extends StatefulWidget {
  Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {

  var visibility = false;
  var imageFile = '';
  var selectedCategory = 'Any';
  var category = [
    'Any',
    'Age',
    'Alone',
    'Amazing',
    'Anger',
    'Architecture',
    'Art',
    'Attitude',
    'Beauty',
    'Best',
    'Birthday',
    'Business',
    'Car',
    'Change',
    'Communications',
    'Computers',
    'Cool',
    'Courage',
    'Dad',
    'Dating',
    'Death',
    'Design',
    'Dreams',
    'Education',
    'Environmental',
    'Equality',
    'Experience',
    'Failure',
    'Faith',
    'Family',
    'Famous',
    'Fear',
    'Fitness',
    'Food',
    'Forgiveness',
    'Freedom',
    'Friendship',
    'Funny',
    'Future',
    'God',
    'Good',
    'Government',
    'Graduation',
    'Great',
    'Happiness',
    'Health',
    'History',
    'Home',
    'Hope',
    'Humor',
    'Imagination',
    'Inspirational',
    'Intelligence',
    'Jealousy',
    'Knowledge',
    'Leadership',
    'Learning',
    'Legal',
    'Life',
    'Love',
    'Marriage',
    'Medical',
    'Men',
    'Mom',
    'Money',
    'Morning',
    'Movies',
    'Success',
  ];
  var quote = '';
  var author = '';

  void getQuote() async {
    EasyLoading.show();
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/quotes?category=${selectedCategory=='Any' ? '' : selectedCategory.toLowerCase()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var dataJson = await response.stream.bytesToString();
      var data = jsonDecode(dataJson);
      quote = data[0]['quote'];
      author = data[0]['author'];
      visibility = true;
      EasyLoading.dismiss();
      print(quote);
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

  void copyText() {
    Clipboard.setData(ClipboardData(text: quote));
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
                  onPressed: getQuote,
                  child: Text(
                    'Get Quote',
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
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 0.5,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        quote,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '~ ${author}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Visibility(
                visible: visibility,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: ElevatedButton(
                    onPressed: copyText,
                    child: Text(
                      'Copy Quote',
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
