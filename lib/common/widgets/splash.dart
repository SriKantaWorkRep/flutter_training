// import 'package:ecommerse_website/common/widgets/DummyScreen.dart';
// import 'package:ecommerse_website/main.dart';
import 'package:dealdox_integrated/common/Navigation/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'DummyScreen.dart';
import 'Registration.dart';
import 'carousal_screen.dart';
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class Splash extends StatefulWidget {
  const Splash({Key? key}):super(key:key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
  super.initState();
  _navigateHome();
  }

  _navigateHome() async{
    await Future.delayed(Duration(milliseconds: 3500),(){});
    // Navigator.pushReplacement(context, MaterialPageRoute(
    //     builder: (context)=>CarouselScreen()));
    GoRouter.of(context).go(AppRouteConstants.carousal);
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();//splash
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body:Container(
        // decoration: BoxDecoration(
        //     color: Colors.grey
        // ),
          child: Column(
            children: [
              Container(
                width: 250, // Increase the width of the Container
                height: 80,
                margin: EdgeInsets.only(top: screenHeight*.25,left: screenWidth*.05),
                child: Image.asset(
                  "assets/images/companyLogo.png",
                  width: 250, // Increase the width of the Container
                  height: 80, // You can adjust the height as needed
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 215,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 430, // Increase the width of the Container
                      height: 145,
                      // decoration: BoxDecoration(
                      //     color: Colors.pink
                      // ),
                      margin: EdgeInsets.only(left: screenWidth*.181,bottom: screenHeight*.01),
                      child: Image.asset(
                        "assets/images/wave.png",
                        // width: 250, // Increase the width of the Container
                        // height: 80, // You can adjust the height as needed
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //     color: Colors.red
                      // ),
                      margin: EdgeInsets.only(right: screenWidth*.03),
                      width: 430, // Increase the width of the Container
                      height: 110,
                      // margin: EdgeInsets.only(left: screenWidth*0),
                      child: Image.asset(
                        "assets/images/wave2.png",
                        // width: 250, // Increase the width of the Container
                        // height: 0, // You can adjust the height as needed
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );

  }
}

