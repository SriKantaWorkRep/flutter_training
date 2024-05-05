import 'dart:async';
import 'dart:convert';
import 'package:dealdox_integrated/api/widgets/UserTile.dart';
import 'package:flutter/material.dart';
import 'package:dealdox_integrated/api/model/User.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DataMap();
  }
}

class DataMap extends StatefulWidget {
  const DataMap({super.key});

  @override
  State<DataMap> createState() => _DataMapState();
}

class _DataMapState extends State<DataMap> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  TextStyle tabsTextStyle=const TextStyle(fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900.withOpacity(.2),
                  borderRadius: BorderRadius.circular(38)
                ),
                child: TabBar(
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  // indicatorPadding: EdgeInsets.all(2),
                  splashBorderRadius: BorderRadius.circular(30),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(colors: [Colors.blue,Colors.blue])
                  ),
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey.shade700,
                  controller: tabController,
                  tabs: const [
                    Center(child: Text("Account Info",style: TextStyle(fontSize: 15)),),
                    Center(child: Text("Opportunities",style: TextStyle(fontSize: 15)),),
                    Center(child: Text("Quotes",style: TextStyle(fontSize: 15)),),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                    controller: tabController,
                    children: const [
                        Center(
                          child: Text("First"),
                        ),
                      Center(
                        child: Text("Second"),
                      ),
                      Center(
                        child: Text("third"),
                      ),
                    ]
                ),
              )
            ],
          )),
    );
  }
}
