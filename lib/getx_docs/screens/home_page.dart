
import 'package:dealdox_integrated/getx_docs/data/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Obx(() => Text(Storage.count.toString())),
              MaterialButton(onPressed: (){
                Storage.count++;
              },child: Icon(Icons.account_balance_wallet),)
            ],
          ),
        ),
      ),
    );
  }
}
