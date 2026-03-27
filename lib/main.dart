import 'package:flutter/material.dart';
import 'package:just_ascend/signin.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the red debug banner
      title: 'Just Ascend',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      // Change 'home' from the "Hello World" Scaffold to your new screen
      home: Signin(), 
    );
  }
}