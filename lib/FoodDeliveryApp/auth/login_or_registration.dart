import 'package:dealdox_integrated/FoodDeliveryApp/pages/login_page.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegistration extends StatefulWidget {
  const LoginOrRegistration({super.key});

  @override
  State<LoginOrRegistration> createState() => _LoginOrRegistrationState();
}

class _LoginOrRegistrationState extends State<LoginOrRegistration> {
  bool showLoginPage=true;
  // void togglePages(){
  //   setState(() {
  //     showLoginPage=!showLoginPage;
  //   });
  // }
  void goToFRegister(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FRegistration(onTap: (){})));
  }
  void goToFLogin(){
    print("hi");
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
     if(showLoginPage){
      return LoginPage(onTap: goToFRegister);
    }else{
       return FRegistration(onTap: goToFLogin);
     };
  }
}
