import 'package:animal_detector/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: HomePage(),

      title: Text("Cat and Dog Detector",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.orange),),
      image: Image.asset("assets/icon.png"),backgroundColor: Colors.white,photoSize: 75,
      loaderColor: Colors.orange,
      loadingText: Text("Developed by Farhan",style: TextStyle(fontSize: 16,color: Colors.black),),
    );
  }
}
