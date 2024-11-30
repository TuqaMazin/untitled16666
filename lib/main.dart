import 'package:flutter/material.dart';
import 'package:untitled16666/about/about_screen.dart';
import 'package:untitled16666/choose_height/choose_height_screen.dart';
import 'package:untitled16666/choose_target_weight/choose_target_weight_screen.dart';
import 'package:untitled16666/choose_weight/choose_weight_screen.dart';
import 'package:untitled16666/home/home_screen.dart';
import 'package:untitled16666/sign_in/sign_in_screen.dart';
import 'package:untitled16666/sign_up/sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
