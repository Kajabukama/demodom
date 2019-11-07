import 'package:demodom/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:demodom/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: "Cereal",
      ),
      home: NewsScreen(),
    );
  }
}
