import 'package:flutter/material.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text("M O B I L E"),
        centerTitle: true,
      ),
      backgroundColor: Colors.purple[300],
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: 16/9,
              child: Container(
                height: 250,
                color: Colors.purple[600],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: 8,
                  itemBuilder: (context,index){
                  return  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 120,
                      color: Colors.purple[400],
                    ),
                  );
                  }
              ),
          ),
        ],
      ),
    );
  }
}
