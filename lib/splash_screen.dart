import 'dart:async';

import 'package:flutter/material.dart';
import 'package:signin/main.dart';
class SplashScreeb extends StatefulWidget {
  const SplashScreeb({Key? key}) : super(key: key);

  @override
  State<SplashScreeb> createState() => _SplashScreebState();
}

class _SplashScreebState extends State<SplashScreeb> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFF800B),
              Color(0xFFCE1010),
            ],
          ),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset("assets/images/asa.png",
                  height: 300.0,
                  width:300.0,),
                Text("Asa",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 150.0,
                  ),),
                Text("A Healing Presense",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),)
              ],
            ),

            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

