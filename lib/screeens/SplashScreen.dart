import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxway_clone/screeens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();



}


class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
  Timer(Duration(seconds: 2),
          ()=>Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>
              HomeScreen()
          )
      )
  );
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(width: double.infinity,height: double.infinity,
      color: Color(0xff51267D),

      child: Center(
        child: Image.asset("images/splash.png",width: 160,height: 160,),
      ),
      
    );
  }
}
