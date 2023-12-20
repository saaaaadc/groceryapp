import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/onboard_screen.dart';
import 'package:groceryapp/register_screen.dart';
import 'package:groceryapp/welcomescreen.dart';
import '';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
  FirebaseOptions(
      apiKey: "AIzaSyBc7-atxFxKop6yvJh7w24Xa2TNcUz4qds",
      appId: "1:812472335604:android:02bc110703c266b7b632a1",
      messagingSenderId: "812472335604",
      projectId: "grocery-app-a0c2f"));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(
          seconds: 3
        ), () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('images/home-page-161.png'),
            Text("Grocery Store",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}

