import 'package:dealdox_integrated/common/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DummyScreen.dart';
import 'congrats_reset.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResetPass();
  }
}
class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
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
                      navigatorKey.currentState!.pop(context);
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
                    "Reset password",
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
                    "Reset your password now",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                _giveFieldName("Email"),
                SizedBox(height: 7,),
                _giveTextFieldSuffix(hintValue: "Enter your email address",suffixIcon2: Icons.visibility,suffixIcon1: Icons.visibility_off,prefixIcon: Icons.lock_outline_rounded,),
                SizedBox(height: 7,),
                _giveFieldName("Confirm Password"),
                SizedBox(height: 7,),
                _giveTextFieldSuffix(hintValue: "Re-enter your password", prefixIcon: Icons.lock_outline_rounded, suffixIcon2: Icons.visibility,suffixIcon1: Icons.visibility_off),
                SizedBox(height: 300,),
                Container(
                  width: 360,
                  height: 65,
                  margin: EdgeInsets.only(left: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(114, 93, 244, 1),
                      Colors.deepPurpleAccent,
                      Color.fromRGBO(111, 103, 190, 1.0),
                      // Colors.blue.shade700,
                      Color.fromRGBO(104, 121, 244, 1),
                      Color.fromRGBO(94, 147, 243, 1)
                    ]),
                  ),
                  child: TextButton(
                      onPressed: () {
                        navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>YourHomePage()));
                       },
                        //navigatorKey.currentState!.push(context,MaterialPageRoute(builder: (context)=>Splash()))
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
                color: borderColor,
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

class YourHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: YourBodyWidget(),
      ),
    );
  }
}

class YourBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(// work
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states){
          if(states.contains(MaterialState.disabled)){
            return Colors.transparent;
          }
          return Colors.white;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return Colors.transparent;
          },
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
            isDismissible: false,
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        // style: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
                        // style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('X',style: TextStyle(fontSize: 15),))
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child:
                      // Image(image: AssetImage('assets/images/verify_bottomsheetUP.png'),width: 200,height: 200,)
                      Image.asset(
                        'assets/images/congarts_reset.png',
                        width: 160,
                        height: 160,
                      )),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Congrats!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Your password reset successfully ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        color: Colors.grey.shade700),
                  ),

                ],
              ),
            ));
      },
      child: Text(''),
    );
  }
}