import 'package:dealdox_integrated/freezed/model/person_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Home();
  }
}

class Home extends StatelessWidget {
  List<PersonModel> personList=[
    PersonModel(),
    PersonModel(name: "Bye"),
    PersonModel(name: "fixit")
  ];
   Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Map<String,dynamic> data={
                "name":null,
              };
             PersonModel model= PersonModel.fromJson(data);
             print(model.toJson());
             // model=model.copyWith(name: "New name");
             print((model.copyWith(name: "New name")).name);
            },
            child:const Icon(Icons.add)
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context,index){
             return Text("name ${personList[index].name} - age ${personList[index].age}");
            }),
      ),
    );
  }
}
