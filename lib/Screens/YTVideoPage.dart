import 'package:flutter/material.dart';
import 'package:study_buddy/CommonWidgets.dart';

class YTVideoPage extends StatefulWidget {
  const YTVideoPage({Key? key}) : super(key: key);

  @override
  _YTVideoPageState createState() => _YTVideoPageState();
}

class _YTVideoPageState extends State<YTVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: StudyBuddyAppBar(title: "YT Videos",),
      ),
      body: Container(),
    );
  }
}
