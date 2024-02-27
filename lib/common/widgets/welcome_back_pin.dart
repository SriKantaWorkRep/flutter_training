
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'DummyScreen.dart';
import 'Registration.dart';
import 'create_a_pin.dart';
import 'welcome_back.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeBackPin();
  }
}

class WelcomeBackPin extends StatefulWidget {
  const WelcomeBackPin({super.key});

  @override
  State<WelcomeBackPin> createState() => _WelcomeBackPinState();
}

class _WelcomeBackPinState extends State<WelcomeBackPin> {
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final pinTheme = PinTheme(
      width: 80,
      height: 55,
      textStyle: GoogleFonts.roboto(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ));
  // @override
  // void dispose() {
  //   _focusNode1.dispose();
  //   _focusNode2.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    margin: EdgeInsets.only(top: 20, left: 25),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      "Please enter your PIN to Continue",
                      style: GoogleFonts.roboto(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 23),
                      child: Text("PIN",style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                      ),),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 2),
                    width: 400,
                    child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.pink
                            ),
                        child: Pinput(
                          obscureText: true,
                          obscuringWidget: Container(
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          length: 4,
                          defaultPinTheme: pinTheme,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 9),
                    child: TextButton(
                      onPressed: () {
                        navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => CreateAPin()));
                      },
                      child: Text(
                        "Forgot PIN?",
                        style: GoogleFonts.roboto(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                  ),
                  Container(
                    width: 360,
                    height: 65,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(114, 93, 244, 1),
                        Colors.deepPurpleAccent,
                        Color.fromRGBO(112, 96, 243, 1),
                        // Colors.blue.shade700,
                        Color.fromRGBO(104, 121, 244, 1),
                        Color.fromRGBO(94, 147, 243, 1)
                      ]),
                    ),
                    child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            // isDismissible: false,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                              context: context, builder: (context)=>
                              Container(
                                height: 350.0,
                                width: double.infinity,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: TextButton(
                                            onPressed: (){
                                              navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>WelcomeBack()));
                                            },
                                            child: Text("X",style: TextStyle(fontSize: 20),),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child:
                                        // Image(image: AssetImage('assets/images/verify_bottomsheetUP.png'),width: 200,height: 200,)
                                        Image.asset('assets/images/congrats.png',width: 180,height: 180,)
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text('Congrats',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30 ),),

                                    SizedBox(height: 7.0,),

                                    Text('Your successfully logged in',
                                      style: TextStyle(fontWeight:FontWeight.normal,fontSize: 17 ,color:Colors.grey.shade700),),



                                  ],
                                ),

                              ));
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                            children: [
                              TextSpan(text: "Dont't have an account? "),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                ..onTap=(){
                                  navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => Registration()));
                                },
                                  text: "Create account",
                                  style: GoogleFonts.roboto(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500),
                              ),
                            ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
