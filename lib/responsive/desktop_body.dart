import 'package:flutter/material.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text("D E S K T O P"),
        centerTitle: true,
      ),
      backgroundColor: Colors.green[300],
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      height: 250,
                      color: Colors.red[600],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            height: 120,
                            color: Colors.red[400],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
         Expanded(child:  Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: AspectRatio(
                 aspectRatio: 10/5,
                 child: Container(
                   height: 400,
                   color: Colors.red[400],
                 ),
               ),
             )
           ],
         ),)
        ],
      ),
    );
  }
}
