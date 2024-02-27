import 'package:dealdox_integrated/common/widgets/validate_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyAppp());
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
      home: Registration(),
    );
  }
}

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  bool checkBoxClick = false;
  bool checkEye = false;
  TextEditingController firstControl = TextEditingController();
  Color borderColor = Colors.red;
  String checkBoxText = "";
  Color _checkBoxErrorColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   color: Colors.red
          // ),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
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
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      "Welcome to DealDox",
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      "Please enter your information to Continue",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _giveFieldName("First name"),
                    _giveTextField(
                        hintValue: "Enter your First name",
                        prefixIcon: Icons.account_circle_outlined),
                    SizedBox(height: 7),
                    _giveFieldName("Last name"),
                    SizedBox(height: 7),
                    _giveTextField(
                        hintValue: "Enter your last name",
                        prefixIcon: Icons.account_circle_outlined),
                    SizedBox(
                      height: 7,
                    ),
                    _giveFieldName("Password"),
                    SizedBox(
                      height: 7,
                    ),
                    _giveTextFieldSuffix(
                      hintValue: "Enter your password",
                      prefixIcon: Icons.lock,
                      suffixIcon1: Icons.visibility_off,
                      suffixIcon2: Icons.visibility,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    _giveFieldName("Confirm password"),
                    SizedBox(
                      height: 7,
                    ),
                    _giveTextFieldSuffix(
                        hintValue: "Re - Enter your password",
                        prefixIcon: Icons.lock,
                        suffixIcon1: Icons.visibility_off,
                        suffixIcon2: Icons.visibility),
                    SizedBox(
                      height: 7,
                    ),
                    _giveFieldName("Company"),
                    SizedBox(
                      height: 7,
                    ),
                    _giveTextField(
                        hintValue: "Enter your Company name",
                        prefixIcon: Icons.home_work_outlined),
                    SizedBox(
                      height: 7,
                    ),
                    _giveFieldName("Job title"),
                    SizedBox(
                      height: 7,
                    ),
                    _giveTextField(
                        hintValue: "Enter Job Title", prefixIcon: Icons.work),
                    SizedBox(
                      height: 7,
                    ),
                    _giveFieldName("Phone number"),
                    SizedBox(
                      height: 7,
                    ),
                    _giveTextField(
                        hintValue: "Enter Business Address",
                        prefixIcon: Icons.email_outlined),
                    SizedBox(
                      height: 7,
                    ),
                    // _giveFieldName("Employees"),
                    // SizedBox(
                    //   height: 7,
                    // ),
                    // _giveTextField("Enter phone number", Icons.phone_in_talk),
                    SizedBox(
                      height: 7,
                    ),
                    _giveFieldName("Employees"),
                    SizedBox(
                      height: 7,
                    ),
                    _giveDropDown(
                        prefixIcon: Icons.people_outline, items: Demo().b),
                    SizedBox(
                      height: 7,
                    ),
                    _giveFieldName("Business email"),
                    SizedBox(
                      height: 7,
                    ),
                    _giveTextField(
                        hintValue: "Enter business address",
                        prefixIcon: Icons.mail_outline),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    _giveFieldName("Country"),
                    SizedBox(
                      height: 7,
                    ),

                    // _giveTextFieldSuffix(hintValue: "Select Country", prefixIcon: Icons.public_outlined,suffixIcon1: Icons.arrow_drop_down_sharp,suffixIcon2: Icons.arrow_drop_up_sharp,),
                    _giveDropDown(
                      prefixIcon: Icons.public_outlined,
                      items: Demo().a,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    checkBoxClick = !checkBoxClick;
                                  });
                                  if (checkBoxClick) {
                                    setState(() {
                                      checkBoxText =
                                          "Please read & agree for the main services";
                                      _checkBoxErrorColor = Colors.red.shade100;
                                    });
                                  } else {
                                    setState(() {
                                      checkBoxText = "";
                                      _checkBoxErrorColor = Colors.transparent;
                                    });
                                  }
                                },
                                child: Container(
                                  child: giveIcon(click: checkBoxClick),
                                ),
                              ),
                              // Icon(Icons.check_box_outline_blank)
                              RichText(
                                text: TextSpan(
                                  // Default text style for the whole RichText
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: " I agree to the ",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    // TextSpan for the underlined part
                                    TextSpan(
                                      text: "Terms Of Use",
                                      style: GoogleFonts.roboto(
                                          decoration: TextDecoration.underline,
                                          color: Colors.black,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 362,
                            height: 30,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                color: _checkBoxErrorColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              checkBoxText,
                              style: GoogleFonts.roboto(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 360,
                      height: 65,
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
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => Dummy()));
                            // Future.delayed(Duration(seconds: 3), () {
                            //     Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
                            //   }
                            //   );
                            showModalBottomSheet(
                              // isDismissible: false,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                              context: context, builder: (context)=>
                                Container(
                                  height: 800,
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
                                                navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>ValidateOTP()));
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
                                          Image.asset('assets/images/verify_bottomsheetUP.png',width: 180,height: 180,)
                                      ),
                                      SizedBox(height: 5.0,),
                                      Text('Verify your email',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30 ),),

                                      SizedBox(height: 8.0,),

                                      Text('Thank you for Registering.',
                                        style: TextStyle(fontWeight:FontWeight.normal,fontSize: 17 ,color:Colors.grey.shade700),),
                                      Text('An OTP has been generated and sent to.',
                                        style: TextStyle(fontWeight:FontWeight.normal,fontSize: 17 ,color:Colors.grey.shade700),),
                                      Text('your email. Please check your email and',
                                        style: TextStyle(fontWeight:FontWeight.normal,fontSize: 17 ,color:Colors.grey.shade700),),
                                      Text('enter the OTP to complete your registration',
                                        style: TextStyle(fontWeight:FontWeight.normal,fontSize: 17 ,color:Colors.grey.shade700),),
                                      Text('process',
                                        style: TextStyle(fontWeight:FontWeight.normal,fontSize: 17 ,color:Colors.grey.shade700),)

                                    ],
                                  ),

                                ),
                            );

                            // Future.delayed(Duration(seconds: 2), () {
                            //   Navigator.push(context, MaterialPageRoute(builder: (context) => ValidateOTP()));
                            // });
                          }
                           ,
                          child: Text(
                            "Start My Free Trial",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      child: RichText(
                        text: TextSpan(
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
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
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "By Registering, you confirm that you agree",
                            style: GoogleFonts.roboto(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "to the storing and processing of",
                              style: GoogleFonts.roboto(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                            ),
                          ),
                          Text(
                            "personal data by DealDox as described in",
                            style: GoogleFonts.roboto(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("the "),
                              Container(
                                child: Text(
                                  "Privacy Policy",
                                  style: GoogleFonts.roboto(
                                      // decoration: TextDecoration
                                      color: Color.fromRGBO(114, 93, 244, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );



  }

  // Container _giveTextField(String hintValue, IconData prefixIcon) {
  //   String errorVal = ''; // State variable to store input value
  //
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 25),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         TextField(
  //           onChanged: (value) {
  //             _checkEmpty(value);//border
  //              if(value.isEmpty){
  //                  setState(() {
  //                    errorVal="Please fill the Required field";
  //                  });
  //              }else{
  //                  setState(() {
  //                    errorVal='';
  //                  });
  //              }
  //           },
  //           decoration: InputDecoration(
  //             focusedBorder: OutlineInputBorder(
  //               borderSide: BorderSide(
  //                 color: borderColor,
  //               ),
  //             ),
  //             border: OutlineInputBorder(
  //               borderSide: BorderSide(color: Colors.red),
  //             ),
  //             hintText: hintValue,
  //             errorText: errorVal.isEmpty?null:errorVal,
  //             hintStyle: GoogleFonts.roboto(color: Colors.black38),
  //             prefixIcon: Icon(
  //               prefixIcon,
  //               size: 30,
  //               color: Colors.black45,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _giveFieldName(String name) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.grey
      // ),

      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 3),
            child: Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
  _navigateHome() async{
    await Future.delayed(Duration(milliseconds: 3500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>Dummy()));
  }
}

class _giveTextField extends StatefulWidget {
  final String hintValue;
  final IconData prefixIcon;
  Color hintcolor = Colors.black38;
  _giveTextField({required this.hintValue, required this.prefixIcon});

  @override
  _giveTextFieldState createState() => _giveTextFieldState();
}

class _giveTextFieldState extends State<_giveTextField> {
  Color borderColor = Colors.grey.shade600;
  String errorVal = ''; // State variable to store input value

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) {
              _checkEmpty(value); // Check for empty value
              setState(() {
                if (value.isEmpty) {
                  errorVal = "Please fill the Required field";
                  widget.hintcolor = Colors.red;
                } else {
                  errorVal = '';
                  widget.hintcolor = Colors.black38;
                }
              });
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: widget.hintValue,
              errorText: errorVal.isEmpty ? null : errorVal,
              hintStyle: GoogleFonts.roboto(color: widget.hintcolor),
              prefixIcon: Icon(
                widget.prefixIcon,
                size: 30,
                color: borderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _checkEmpty(String c) {
    if (c.isEmpty == true) {
      setState(() {
        borderColor = Colors.red;
      });
    } else {
      setState(() {
        borderColor = Colors.black;
      });
    }
  }
}

//---------- for suffix Icon
class _giveTextFieldSuffix extends StatefulWidget {
  final String hintValue;
  final IconData prefixIcon;
  final IconData suffixIcon1;
  final IconData suffixIcon2;
  bool obscureText = true;
  bool checkEye = true;
  Color hintcolor = Colors.black38;
  _giveTextFieldSuffix(
      {required this.hintValue,
      required this.prefixIcon,
      required this.suffixIcon1,
      required this.suffixIcon2});

  @override
  _giveTextFieldSuffixState createState() => _giveTextFieldSuffixState();
}

class _giveTextFieldSuffixState extends State<_giveTextFieldSuffix> {
  Color borderColor = Colors.red;
  String errorVal = ''; // State variable to store input value

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            obscureText: widget.obscureText,
            onChanged: (value) {
              _checkEmpty(value); // Check for empty value
              setState(() {
                if (value.isEmpty) {
                  errorVal = "Please fill the Required field";
                  widget.hintcolor = Colors.red;
                } else {
                  errorVal = '';
                  widget.hintcolor = Colors.black38;
                }
              });
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: widget.hintValue,
              errorText: errorVal.isEmpty ? null : errorVal,
              hintStyle: GoogleFonts.roboto(color: widget.hintcolor),
              prefixIcon: Icon(
                widget.prefixIcon,
                size: 30,
                color: Colors.black45,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.checkEye = !widget.checkEye;
                    if (widget.checkEye) {
                      setState(() {
                        widget.obscureText = true;
                      });
                    } else {
                      setState(() {
                        widget.obscureText = false;
                      });
                    }
                  });
                },
                child: Icon(
                    widget.checkEye ? widget.suffixIcon1 : widget.suffixIcon2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _checkEmpty(String c) {
    if (c.isEmpty == true) {
      setState(() {
        borderColor = Colors.red;
      });
    } else {
      setState(() {
        borderColor = Colors.black;
      });
    }
  }
}

//-------- for checking icon -------------
class giveIcon extends StatefulWidget {
  final bool click;
  IconData one = Icons.check_box_outline_blank;
  IconData two = Icons.check_box_rounded;
  giveIcon({required this.click});

  @override
  State<giveIcon> createState() => _giveIconState();
}

class _giveIconState extends State<giveIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(widget.click ? widget.one : widget.two);
  }
}
// ----------- eye checker ----------

// class giveEye extends StatefulWidget {
//   final bool check;
//   IconData one =Icons.visibility;
//   IconData two=Icons.visibility_off;
//    giveEye({required this.check});
//   @override
//   State<giveEye> createState() => _giveEyeState();
// }
//
// class _giveEyeState extends State<giveEye> {
//   @override
//   Widget build(BuildContext context) {
//     return Icon(widget.check?widget.one:widget.two);
//   }
// }

class _giveDropDown extends StatefulWidget {
  String _value = "-1";
  Color borderColor = Colors.grey.shade700;
  final IconData prefixIcon;
  final List<DropdownMenuItem> items;
  _giveDropDown({super.key, required this.prefixIcon, required this.items});

  @override
  State<_giveDropDown> createState() => _giveDropDownState();
}

class _giveDropDownState extends State<_giveDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField(
              value: widget._value,
              items: widget.items,
              onChanged: (val) {
                setState(() {
                  widget._value = val.toString();
                  if (widget._value == "-1") {
                    widget.borderColor = Colors.red;
                  } else {
                    widget.borderColor = Colors.grey.shade700;
                  }
                });
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor),
                ),
                // hintText: widget.hintValue,
                // errorText: errorVal.isEmpty ? null : errorVal,
                hintStyle: GoogleFonts.roboto(color: Colors.black38),
                prefixIcon: Icon(widget.prefixIcon),
              ),
            ),
          ],
        ));
    ;
  }
}

class Demo {
  List<DropdownMenuItem> a = [
    DropdownMenuItem(
      child: Text(
        "Select country",
        style: GoogleFonts.roboto(color: Colors.grey.shade700),
      ),
      value: "-1",
    ),
    DropdownMenuItem(
      child: Text("India"),
      value: "1",
    ),
    DropdownMenuItem(
      child: Text("Usa"),
      value: "2",
    ),
    DropdownMenuItem(
      child: Text("Russia"),
      value: "3",
    ),
    DropdownMenuItem(
      child: Text("China"),
      value: "4",
    ),
  ];
  List<DropdownMenuItem> b = [
    DropdownMenuItem(
      child: Text(
        "Select number of employee",
        style: GoogleFonts.roboto(color: Colors.grey.shade700),
      ),
      value: "-1",
    ),
    DropdownMenuItem(
      child: Text("1-20 employees"),
      value: "1",
    ),
    DropdownMenuItem(
      child: Text("21-200 employees"),
      value: "2",
    ),
    DropdownMenuItem(
      child: Text("200-10,000 employees"),
      value: "3",
    ),
    DropdownMenuItem(
      child: Text("10,000+ employees"),
      value: "4",
    ),
  ];
}
