
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DummyScreen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResetYourPass();
  }
}
class ResetYourPass extends StatefulWidget {
  const ResetYourPass({super.key});

  @override
  State<ResetYourPass> createState() => _ResetYourPassState();
}

class _ResetYourPassState extends State<ResetYourPass> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
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
                    "Reset your password",
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
                    "Please enter your email associated with yourt",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "account",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                _giveFieldName("Email"),
                SizedBox(height: 7,),
                _giveTextField(hintValue: "Enter your email address", prefixIcon: Icons.email_outlined),
                SizedBox(height: 340,),
                Container(
                  width: 360,
                  height: 65,
                  margin: EdgeInsets.only(left: 17),
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
                        navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => Dummy()));
                      },
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
                  child: Center(
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