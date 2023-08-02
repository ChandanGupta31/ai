import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  var emailID = TextEditingController();
  var password = TextEditingController();
  var confirmPass = TextEditingController();

  void signUp(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Image.asset('assets/images/background.jpg',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: emailID,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                        label: Text('Email ID'),
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
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                        label: Text('Password'),
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
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: confirmPass,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      label: Text('Confirm Password'),
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
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.92,
                  height: MediaQuery.of(context).size.height*0.065,
                  child: ElevatedButton(
                    onPressed: signUp,
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shadowColor: Colors.grey
                    ),
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
