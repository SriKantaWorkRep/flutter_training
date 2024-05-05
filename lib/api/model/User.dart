import 'dart:core';

class User{
  String? name;
  int? id;
  String? place;
  int? age;
  List<dynamic>? hobbies;

  User({this.id, this.place, this.age, this.hobbies, this.name,});
  //named constructor
  User.srikanta({required this.id});
  User.aftab({required this.name,required this.age});
  factory User.fromJson(Map<String,dynamic> json){
    print(json);
    return User(
        id: json['id'],
        name: json['name'],
        place: json['place'],
        age: json['age'],
        hobbies: json['hobbies']
    );
  }

}