import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              signIn("","");
            },
          ),
        ),
      ),
    );
  }


  Future<void> signIn(String email, String password) async {
    print("starting json fetching");
    try {
      final url=Uri.https("devqa-api.dealdox.io","api/admin/login");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"userEmail": "srikanta@srikanta.com", "password": "Spm@12345"}),
      );
      print("executed json");
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print("Error fetching data: $error");
      throw Exception('Failed to sign in: $error');
    }
  }

}

