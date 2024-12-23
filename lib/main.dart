import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled16666/sign_in/sign_in_screen.dart';

void main() {
  // Register the controller here

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      home: SignInScreen(), // Make sure this is the correct entry point
    );
  }
}