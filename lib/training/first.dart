import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
//adding shadow to icons byb stacking on each other
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Transform(
              alignment: Alignment.topRight,
                transform: Matrix4.skew(10,10),
              child:Icon(Icons.account_balance_wallet,size: 100,color: Colors.black87.withAlpha(25),),
            ),
            Icon(Icons.account_balance_wallet,size: 100,),
          ],
        ),
      ),
    );
  }
}
