
import 'package:dealdox_integrated/common/widgets/welcome_back_pin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeBack();
  }
}
class WelcomeBack extends StatefulWidget {
  const WelcomeBack({super.key});

  @override
  State<WelcomeBack> createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  bool checkBoxClick = false;
  bool checkEye = false;
  TextEditingController firstControl = TextEditingController();
  Color borderColor = Colors.red;
  String checkBoxText = "";
  Color _checkBoxErrorColor=Colors.transparent;
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
                    "Please enter your email ID and password to",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "continue",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                _giveFieldName("Email"),
                SizedBox(height: 7,),
                _giveTextField(hintValue: "Enter your Email Address", prefixIcon: Icons.email_outlined),
                SizedBox(height: 7,),
                _giveFieldName("Password"),
                SizedBox(height: 7,),
                _giveTextFieldSuffix(hintValue: "Enter your password", suffixIcon1: Icons.visibility_off,suffixIcon2: Icons.visibility,prefixIcon: Icons.lock_outline_rounded,),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      "Recomended to save Password";
                                      _checkBoxErrorColor=Colors.red.shade100;
                                    });
                                  } else {
                                    setState(() {
                                      checkBoxText = "";
                                      _checkBoxErrorColor=Colors.transparent;
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
                                      text: " Save Password",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 25),
                            child: Text("Forget password?",style: GoogleFonts.roboto(
                              color: Colors.red,
                              fontSize: 16
                            ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 362,
                        height: 30,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            color: _checkBoxErrorColor,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                            child: Text(checkBoxText,
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
                  height: 200,
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
                        navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => WelcomeBackPin()));
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
    );
  }
  _giveFieldName(String name) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 26),
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
        ],
      ),
    );
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
  Color borderColor = Colors.grey.shade700;
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
                  widget.hintcolor = Colors.grey.shade700;
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
                borderSide: BorderSide(color: Colors.grey.shade700),
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
        borderColor = Colors.grey.shade700;
      });
    }
  }
}

class _giveTextFieldSuffix extends StatefulWidget {
  final String hintValue;
  final IconData prefixIcon;
  final IconData suffixIcon1;
  final IconData suffixIcon2;
  bool obscureText = true;
  bool checkEye = true;
  Color hintcolor = Colors.black38;
  Color errorColor=Colors.red;
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
                color: widget.hintcolor,
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
                    widget.checkEye ? widget.suffixIcon1 : widget.suffixIcon2,),
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
    return Icon(widget.click ? widget.one : widget.two,color: Colors.grey.shade600,);
  }
}