import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Person extends Equatable{
  final String name;
  final int age;
  Person({required this.name,required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name,age];

//   @override
//   bool operator ==(Object other){
//     return identical(this,other)||
//         other is Person&&
//             runtimeType==other.runtimeType&&
//             name==other.name&&
//         age==other.age;
// }
//
//   @override
//   int get hashCode => name.hashCode^age.hashCode;


}