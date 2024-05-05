import 'package:dealdox_integrated/weather_app/bloc/weather_bloc.dart';
import 'package:dealdox_integrated/weather_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,600),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(_,child){
        return MaterialApp(
          debugShowCheckedModeBanner:false,
          home:child,
        );
      },
      child:
      // FutureBuilder(
      //   future: _determinePosition(),
      //   builder: (context, snap){
      //     print(snap.hasData);
      //   if(snap.hasData){
       // return
        BlocProvider<WeatherBloc>(
          //position: snap.data as Position
          create: (context) => WeatherBloc()..add(FetchWeatherEvent(cityName: 'new York')),
          child: HomeScreen(),
        )
        // }
        // else{
        //   return const Scaffold(
        //     body: Center(child: CircularProgressIndicator(),),
        //   );
        // }

    );
  }


  Future<Position> _determinePosition() async {
    print("hi");
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled.toString()+'  serviceEnabled');
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    print(permission.toString() +' permission first' );
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      print(permission.toString() +' permission');
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print(permission.toString() +' permission forever');
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    print((await Geolocator.getCurrentPosition()).toString());
    return await Geolocator.getCurrentPosition();
  }
}


