import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_buddy/LandingPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Buddy',
      home: const SplashScrren(),
    );
  }
}

class SplashScrren extends StatefulWidget {
  const SplashScrren({Key? key}) : super(key: key);

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LandingPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Image.asset("./assets/images/logo.png",height: MediaQuery.of(context).size.height,) //FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
