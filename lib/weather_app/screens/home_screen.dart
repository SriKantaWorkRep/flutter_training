import 'dart:async';
import 'dart:ui';
import 'package:dealdox_integrated/weather_app/bloc/weather_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///
  WeatherBloc weatherBloc = WeatherBloc();
  var time = DateTime.now();
  @override
  void initState() {
    print("init State");
    weatherBloc..add(FetchWeatherEvent(cityName: "Bangalore"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer? _debounce;
    TextEditingController textController = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        ),
        body: SizedBox(
          child: Stack(
            children: [
              Center(
                child: Row(
                  children: [
                    Container(
                        height: 170.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(130),
                          // shape: BoxShape.circle,
                        )),
                    Spacer(),
                    Container(
                      height: 170.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 205.h,
                          width: 205.w,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(195, 124, 2, 1),
                            shape: BoxShape.rectangle,
                          )),
                    ],
                  ),
                ],
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.w, sigmaY: 70.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
              BlocConsumer<WeatherBloc, WeatherBlocState>(
                bloc: weatherBloc,
                listenWhen: (previous, current) => current is WeatherBlocState,
                buildWhen: (previous, current) =>current is WeatherBlocState,
                listener: (context, state) {},
                builder: (context, state) {
                  // print("triggered");
                  if (state is WeatherBlocSuccessState) {
                    print(state.weather);
                    String mainImage = '';
                    if (state.weather.weatherMain == 'Clouds') {
                      mainImage = 'assets/images/1.png';
                    } else if (state.weather.weatherMain == 'Rain') {
                      mainImage = 'assets/images/2.png';
                    } else if (state.weather.weatherMain == 'Snow') {
                      mainImage = 'assets/images/3.png';
                    } else if (state.weather.weatherMain == 'Clear') {
                      mainImage = 'assets/images/7.png';
                    }
                    String greetings = '';
                    if (int.parse(state.weather.date
                                .toString()
                                .substring(11, 13)) <=
                            12 &&
                        int.parse(state.weather.date
                                .toString()
                                .substring(11, 13)) >=
                            5) {
                      greetings = 'Good Morning';
                    } else if (int.parse(state.weather.date
                                .toString()
                                .substring(11, 13)) >
                            12 &&
                        int.parse(state.weather.date
                                .toString()
                                .substring(11, 13)) <
                            18) {
                      greetings = ' Good Afternoon';
                    } else {
                      greetings = ' Good Evening';
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top:60.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on,
                                    color: Colors.red, size: 33),
                                Container(
                                  height: 60,
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: state.weather.areaName,
                                      hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.transparent)
                                      ),
                                      // enabledBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(color: Colors.transparent)
                                      // ),
                                      focusedBorder: OutlineInputBorder(

                                          borderSide: BorderSide(color: Colors.transparent)
                                      ),
                                    ),
                                    controller: textController,
                                    onChanged: (_) async {
                                      _debounce?.cancel();
                                      // Schedule a new future to execute after 9 seconds
                                      _debounce =
                                          Timer(Duration(seconds: 5), () {
                                        print(textController.text + " name");
                                        print("running async");
                                        weatherBloc
                                          ..add(FetchWeatherEvent(
                                              cityName: textController.text));
                                      });
                                      // _debounce?.cancel();
                                      // setState(() {
                                      //   state.weather;
                                      // });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 17.h,
                            ),
                            Text(
                              greetings,
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .7.w,
                                  color: Colors.white),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: Image.asset(
                                  getWeatherIcon(
                                      state.weather.weatherConditionCode!),
                                  width: 220.w,
                                  height: 220.h,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${state.weather.temperature.toString().substring(0, 3)}°C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 45.sp),
                              ),
                            ),
                            Center(
                              child: Text(
                                state.weather.weatherMain!,
                                style: GoogleFonts.acme(
                                    letterSpacing: .8.w,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 35.sp),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                '${DateFormat('EEEE, d - hh:mm a').format(time)}',
                                style: GoogleFonts.truculenta(
                                    letterSpacing: .8.w,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.sp),
                              ),
                            ),
                            SizedBox(
                              height: 55.h,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/11.png',
                                          scale: 8.r,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sunrise',
                                              style: TextStyle(
                                                  letterSpacing: .8.w,
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            Text(
                                              // '${DateFormat('h :mm a').format(time)}',
                                              state.weather.sunrise
                                                      .toString()
                                                      .substring(12, 16) +
                                                  ' AM',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/12.png',
                                          scale: 8.r,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sunrise',
                                              style: TextStyle(
                                                  letterSpacing: .8.h,
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            Text(
                                              // '${DateFormat('h :mm a').format(time)}',
                                              state.weather.sunset
                                                      .toString()
                                                      .substring(12, 16) +
                                                  ' PM',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/13.png',
                                          scale: 8.r,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Temp max',
                                              style: TextStyle(
                                                  letterSpacing: .8.w,
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            Text(
                                              state.weather.tempMax
                                                      .toString()
                                                      .substring(0, 5) +
                                                  '°C',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/14.png',
                                          scale: 8.r,
                                        ),
                                        // SizedBox(width: 5,),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Temp Min',
                                              style: TextStyle(
                                                  letterSpacing: .8.w,
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            Text(
                                              state.weather.tempMin
                                                      .toString()
                                                      .substring(0, 5) +
                                                  '°C',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (state is WeatherBlocLoadingState) {
                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(
                          semanticsLabel: "Fetching data please wait!...",
                        ),
                      ),
                    );
                  } else {
                    return Scaffold(
                      body: Center(
                        child: Text(state.toString()),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return 'assets/images/1.png';
      case >= 200 && < 300:
        return 'assets/images/2.png';
      case >= 200 && < 300:
        return 'assets/images/3.png';
      case >= 200 && < 300:
        return 'assets/images/4.png';
      case >= 200 && < 300:
        return 'assets/images/5.png';
      case >= 200 && < 300:
        return 'assets/images/6.png';
      case >= 200 && < 300:
        return 'assets/images/7.png';
      default:
        return 'assets/images/8.png';
    }
  }
}
