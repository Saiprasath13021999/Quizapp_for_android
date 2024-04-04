import 'package:flutter/material.dart';
import 'package:quizapp/home.dart'; // Import your Homepage widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(), // Set Homepage as the home screen
    );
  }
}
