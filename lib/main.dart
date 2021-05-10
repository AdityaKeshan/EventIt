import 'package:eventit/create_event.dart';
import 'package:eventit/review.dart';
import 'package:eventit/signin.dart';
import 'package:eventit/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignUp.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>SignIn(),
        '/signup':(context) => SignUp(),
        '/home':(context) => CreateEvent()
      },
      debugShowCheckedModeBanner: false,
    ) ;
  }
}
