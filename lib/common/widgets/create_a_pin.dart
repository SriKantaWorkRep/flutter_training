// import 'package:dealdox_demo/main.dart';
import 'package:dealdox_integrated/common/widgets/welcome_back.dart';
import 'package:dealdox_integrated/common/widgets/welcome_back_pin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateAPin();
  }
}

class CreateAPin extends StatefulWidget {
  CreateAPin({super.key});

  @override
  State<CreateAPin> createState() => _CreateAPinState();
}

class _CreateAPinState extends State<CreateAPin> {

  final pinTheme = PinTheme(
      width: 85,
      height: 60,
      textStyle: GoogleFonts.roboto(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade500),
      ));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
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
                    "Create a PIN",
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
                    "Generate your 4-digit pin to keep your account",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "secure from unauthorized access",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "Generate PIN",
                    style: GoogleFonts.roboto(
                        color: Colors.grey.shade800,
                      fontSize: 15,

                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  width: 350,
                  child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.pink
                          ),
                      child: Pinput(
                        length: 4,
                        obscureText: true,
                        // obscuringCharacter: ".",
                        obscuringWidget: Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        defaultPinTheme: pinTheme,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "Confirm PIN",
                    style: GoogleFonts.roboto(
                      color: Colors.grey.shade800,
                      fontSize: 15,

                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  width: 350,
                  child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.pink
                      ),
                      child: Pinput(
                        length: 4,
                        obscureText: true,
                        // obscuringCharacter: ".",
                        obscuringWidget: Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        defaultPinTheme: pinTheme,
                      )),
                ),
                SizedBox(
                  height: 270,
                ),
                Container(
                  width: 360,
                  height: 65,
                  margin: EdgeInsets.only(left: 16),
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
                        // navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => WelcomeBack()));
                        showModalBottomSheet(
                            // isDismissible: false,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                            context: context,
                            builder: (context) => Container(
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
                                            navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>WelcomeBackPin()));
                                          },
                                          child: Text("X",style: TextStyle(fontSize: 20),),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child:
                                      // Image(image: AssetImage('assets/images/verify_bottomsheetUP.png'),width: 200,height: 200,)
                                      Image.asset(
                                        'assets/images/pin generated.png',
                                        width: 180,
                                        height: 180,
                                      )),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text(
                                    'PIN Generated',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text(
                                    'You successfully generated PIN. You can ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17,
                                        color: Colors.grey.shade700),
                                  ),
                                  Text(
                                    'use this PIN later to login ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17,
                                        color: Colors.grey.shade700),
                                  ),
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
                SizedBox(height: 16,),
                Center(
                  child: Container(
                    child: RichText(
                      text: TextSpan(
                          style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                          children: [
                            TextSpan(text: "Dont have an account? "),
                            TextSpan(
                                text: "Create account",
                                style: GoogleFonts.roboto(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500))
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
