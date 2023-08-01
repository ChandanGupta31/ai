import 'package:ai/screens/home.dart';
import 'package:ai/screens/login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var emailID = TextEditingController();
    var password = TextEditingController();
    var conf_pass = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Image.asset('assets/images/background.jpg',height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.fill),
            Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: emailID,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.cyanAccent,
                    decoration: InputDecoration(
                        label:Text('Email ID*'),
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
                  child:  TextField(
                    controller:password ,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.cyanAccent,
                    decoration: InputDecoration(
                        label:Text('Password'),
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
                    cursorColor: Colors.cyanAccent,
                    decoration: InputDecoration(
                      label:Text('Confirm Password'),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),

                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home()) );
                  },
                  child: Text('SignUp'),
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.cyanAccent,
                      shadowColor: Colors.blueGrey
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child: Text('Have Account'),
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.cyanAccent,
                      shadowColor: Colors.blueGrey
                  ),
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
