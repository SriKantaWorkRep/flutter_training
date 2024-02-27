// import 'package:flutter/material.dart';
//
//
// void congrats_content(context)
// {
//   showModalBottomSheet(
//     // isDismissible: false,
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
//       context: context, builder: (context)=>
//       Container(
//         height: 350.0,
//         width: double.infinity,
//
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   child: TextButton(
//                     onPressed: (){
//                       navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>ValidateOTP()));
//                     },
//                     child: Text("X",style: TextStyle(fontSize: 20),),
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//                 padding: const EdgeInsets.only(top: 30),
//                 child:
//                 // Image(image: AssetImage('assets/images/verify_bottomsheetUP.png'),width: 200,height: 200,)
//                 Image.asset('assets/images/congrats.png',width: 180,height: 180,)
//             ),
//             SizedBox(height: 10.0,),
//             Text('Congrats',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30 ),),
//
//             SizedBox(height: 7.0,),
//
//             Text('Your successfully logged in',
//               style: TextStyle(fontWeight:FontWeight.normal,fontSize: 17 ,color:Colors.grey.shade700),),
//
//
//
//           ],
//         ),
//
//       ));
//
// }