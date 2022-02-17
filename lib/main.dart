import 'package:flutter/material.dart';
import 'package:study_buddy/LandingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Buddy',
      // theme: ThemeData.dark(
      
      // ),
      home: const LandingPage(),
    );
  }
}
