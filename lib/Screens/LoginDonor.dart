import 'package:annapurna/Screens/RegisterDonor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import '../helper/loading.dart';
import 'Donate.dart';
import 'HomeScreen.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body://
            // SingleChildScrollView(
            //  child:
      SingleChildScrollView(
        child: Stack(children: <Widget>[

             Column(
               children: [
                       SizedBox(
                         height: 150,
                       ),
                       Padding(
                         padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 42.0),
                         child: Container(

                           decoration: BoxDecoration(
                               border: Border.all(
                                 width:3,
                                   color: const Color.fromARGB(
                                       0xFF, 0x98, 0x31, 0x6A)),
                               borderRadius: BorderRadius.circular(30),
                               color: Colors.white),
                           height: MediaQuery.of(context).size.height*0.52,
                         //  padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                              child: Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    child: Column(children: <Widget>[
                                      SizedBox(height: 60,),
                                      Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Email',
                                            hintStyle: TextStyle(
                                                fontSize: 23,
                                                color: Color.fromARGB(
                                                    0xFF, 0x98, 0x31, 0x6A),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          validator: (val) =>
                                              val!.isEmpty ? 'Enter an email' : null,
                                          onChanged: (val) {
                                            setState(() => email = val);
                                          },
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                                fontSize: 23,
                                                color: Color.fromARGB(
                                                    0xFF, 0x98, 0x31, 0x6A),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          obscureText: true,
                                          validator: (value) => value!.length < 6
                                              ? 'Enter a password of 6 or more characters'
                                              : null,
                                          onChanged: (val) {
                                            setState(() => password = val);
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 100.0),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(11)
                                              )),
                                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(0xFF, 0x98, 0x31, 0x6A))
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Sign In',
                                              style: TextStyle(
                                                  fontFamily: 'Mochiy Pop P One',
                                                  color: Colors.white,
                                                  fontSize: 27),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState!.validate()) {
                                              dynamic result =
                                                  await _auth.signInWithEmailAndPassword(
                                                      email: email, password: password);
                                              if (result == null) {
                                                setState(() {
                                                  error = 'please supply a valid email';
                                                  loading = false;
                                                });
                                              } else {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => Donate(lat:0,long:0)),
                                                );
                                              }
                                            }
                                          }),

                                      Row(
                                        children: [
                                          SizedBox(width: 30,),
                                          Text("Don't have an account?",style: TextStyle(fontSize: 15,
                                              color: Color.fromARGB(
                                                  0xFF, 0x98, 0x31, 0x6A),
                                              fontWeight: FontWeight.w500),),
                                          TextButton(onPressed:() => Navigator.pop(context), child: Text("Register",style:TextStyle(fontSize: 15,
                                              color: Color.fromARGB(
                                                  0xFF, 0x98, 0x31, 0x6A),
                                              fontWeight: FontWeight.w500),
                                            ))
                                        ],
                                      ),
                                    ]),
                                  )),
                            ),
                       
                 ),
               ],
             ),
                  Positioned(
                    child: Image(image: AssetImage('images/donor-image-1.png')),
                    top: MediaQuery.of(context).size.height * 0.12,
                    left: MediaQuery.of(context).size.width * 0.33,
              //    ),

         //   ]
    ),
              ]),
      )
    );
  }
}
