import 'package:flutter/material.dart';

class TextSimilarity extends StatefulWidget {
  TextSimilarity({super.key});

  @override
  State<TextSimilarity> createState() => _TextSimilarityState();
}

class _TextSimilarityState extends State<TextSimilarity> {
  @override
  Widget build(BuildContext context) {
  var textFirst = TextEditingController();
  var textSecond = TextEditingController();
  var buttonName ='Check';
  var textController = TextEditingController();
  var visibility = false;
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
         child:SingleChildScrollView(
           child: Column(
             children: [
               SizedBox(height: MediaQuery.of(context).size.height*0.05,),
               TextField(
                 controller: textFirst,
                 minLines: 5,
                 maxLines: 300,
                 keyboardType: TextInputType.text,
                 cursorColor: Theme.of(context).primaryColor,
                 decoration: InputDecoration(
                     label: Text('First Text'),
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
               TextField(
                 controller: textSecond,
                 keyboardType: TextInputType.text,
                 minLines: 5,
                 maxLines: 300,
                 cursorColor: Theme.of(context).primaryColor,
                 decoration: InputDecoration(
                     label: Text('Second Text'),
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
                   onPressed: (){
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
    );
  }
}
