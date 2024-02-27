
import 'package:dealdox_integrated/common/widgets/create_a_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'DummyScreen.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValidateOTP();
  }
}
class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return Dummy();
  }
}
class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ValidateOTP(),
    );
  }
}

class ValidateOTP extends StatefulWidget {
  const ValidateOTP({super.key});

  @override
  State<ValidateOTP> createState() => _ValidateOTPState();
}

class _ValidateOTPState extends State<ValidateOTP> {

  final pinTheme= PinTheme(
      width: 56,
      height: 60,
      textStyle: GoogleFonts.roboto(
          fontSize: 22,
          color: Colors.black
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      )
  );
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
                      "Validate OTP",
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
                      "Enter the OTP sent to your email",
                      style: GoogleFonts.roboto(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 350,
                    child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.pink
                        ),
                        child:Pinput(
                          length: 6,
                          defaultPinTheme: pinTheme,
                        )
                    ),
                  ),
                  SizedBox(height: 430,),
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
                          // navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => Dummy()));
                          showModalBottomSheet(
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
                                              navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>CreateAPin()));
                                            },
                                            child: Text("X",style: TextStyle(fontSize: 20),),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child:
                                        // Image(image: AssetImage('assets/images/verify_bottomsheetUP.png'),width: 200,height: 200,)
                                        Image.asset('assets/images/success.png',width: 180,height: 180,)
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text('Success',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30 ),),

                                    SizedBox(height: 7.0,),

                                    Text('Your OTP successfully entered in our ',
                                      style: TextStyle(fontWeight:FontWeight.normal,fontSize: 17 ,color:Colors.grey.shade700),),
                                    Text('system',
                                      style: TextStyle(fontWeight:FontWeight.normal,fontSize: 17 ,color:Colors.grey.shade700),),
                                  ],
                                ),
                              ),
                          );
                        },
                        child: Text(
                          "Next",
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
                              TextSpan(text: "Have an account? "),
                              TextSpan(
                                  text: "Sign in",
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
      ),
    );
  }
}
