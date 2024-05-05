import 'package:flutter/material.dart';
import '../model/User.dart';

class UserTile extends StatelessWidget {
  final User u;
  const UserTile({super.key,required this.u});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("name ${u.name}"),
          Text("age: ${u.age.toString()}"),
          Text("Hobbies: ${u.hobbies!.map((e) =>e.toString())}"),
        ],
      ),
    );
  }
}
