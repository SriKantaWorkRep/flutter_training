import 'package:dealdox_integrated/common/widgets/welcome_back_pin.dart';
import 'package:flutter/material.dart';

void pin_generated_content(context) {
  showModalBottomSheet(
    isDismissible: false,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: context,
      builder: (context) => Container(
        height: 350.0,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: TextButton(
                onPressed: (){
                  navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>WelcomeBackPin()));
                },
                child: Text("X",style: TextStyle(fontSize: 20),),
              ),
            )
          ],
        ),
            Padding(
                padding: const EdgeInsets.only(top: 3),
                child:
                // Image(image: AssetImage('assets/images/verify_bottomsheetUP.png'),width: 200,height: 200,)
                Image.asset(
                  'assets/images/pin generated.png',
                  width: 180,
                  height: 180,
                )),
            SizedBox(
              height: 7.0,
            ),
            Text(
              'PIN Generated',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 7.0,
            ),
            Text(
              'You successfully generated PIN. You can ',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: Colors.grey.shade700),
            ),
            Text(
              'use this PIN later to login ',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: Colors.grey.shade700),
            ),
          ],
        ),
      ));
}
