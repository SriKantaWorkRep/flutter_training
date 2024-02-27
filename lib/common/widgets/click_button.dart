// import 'dart:ui';
//
// import 'package:dealdox_integrated/common/widgets/pin_generated_content.dart';
// import 'package:dealdox_integrated/common/widgets/success_content.dart';
// import 'package:dealdox_integrated/common/widgets/verify_content.dart';
// import 'package:flutter/material.dart';
//
// import 'congrats_content.dart';
// import 'congrats_reset.dart';
//
//
// class ClickedButton extends StatefulWidget {
//   const ClickedButton({super.key});
//
//   @override
//   State<ClickedButton> createState() => _ClickedButtonState();
// }
//
// class _ClickedButtonState extends State<ClickedButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ElevatedButton(onPressed: (){
//               // verify_content(context);
//             },
//                 child:Text('verify')
//             ),
//
//             ElevatedButton(onPressed: (){
//               success_content(context);
//             },
//                 child:Text('success')
//             ),
//             ElevatedButton(onPressed: (){
//               congrats_content(context);
//             },
//                 child:Text('congrats')
//             ),
//
//             ElevatedButton(onPressed: (){
//               pin_generated_content(context);
//             },
//                 child:Text('pin gen')
//             ),
//
//             ElevatedButton(onPressed: (){
//               Congrats().congrats_reset_content(context);
//             },
//                 child:Text('reset congrats')
//             ),
//
//
//
//
//           ],
//         )
//
//
//
//     );
//   }
// }
//
