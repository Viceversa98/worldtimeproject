
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtimeproject/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {




  void setupWorldTime() async {

  WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png',url:'Europe/Berlin');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location':instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDaytime' : instance.isDaytime,
  });




}

  @override
  void initState() {

    super.initState();
    setupWorldTime();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}