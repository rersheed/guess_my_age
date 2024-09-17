import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp();

  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      title: "Guess My Age",
      home: HomeScreen(),
    );
  }
}