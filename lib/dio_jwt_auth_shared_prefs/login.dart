import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginDioJwt extends StatefulWidget {
  LoginDioJwt({super.key});

  @override
  State<LoginDioJwt> createState() => _LoginDioJwtState();
}

class _LoginDioJwtState extends State<LoginDioJwt> {
  // SharedPreferences? sharedPreferences;
  bool isUserLoggedIn = false;
  Dio dio = Dio();
  @override
  void initState() {
    super.initState();
  getValue();
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("JWT Auth"),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          OutlinedButton(
              onPressed: () {
                // login(nameController.text, passwordController.text);
              },
              child: const Text("Login"))
        ],
      ),
    );
  }

  void login(String email, String pass) async {
    final url = Uri.https('devqa-api.dealdox.io', 'api/admin/login');
    try {
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({"userEmail": email, "password": pass}),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var sharedPreferences = await SharedPreferences.getInstance();
        // await sharedPreferences.setString('token', data['token']);
        // print(sharedPreferences.get('token'));
      }
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  void getValue() async{
    var prefs=await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print(token);
  }
}
