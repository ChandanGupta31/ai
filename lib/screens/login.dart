import 'package:flutter/material.dart';

import 'home.dart';


class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var password = TextEditingController();
    var conf_pass = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Stack(
            children: [
            Image.asset('assets/images/background.jpg',height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.fill),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:  TextField(
                  controller:password ,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      label: Text('Password'),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      )
                  ),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),

            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  controller: conf_pass,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      label: Text('Confirm Password'),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      )
                  ),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),

            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home()) );
                },
                child: Text('Login'),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: Colors.cyanAccent,
                shadowColor: Colors.blueGrey
              )
            ),
          ],
        ),
        ]
        ),
      ),
    );
  }
}
