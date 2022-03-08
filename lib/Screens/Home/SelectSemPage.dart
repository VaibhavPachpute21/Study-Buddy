import 'package:flutter/material.dart';
import 'package:study_buddy/CommonWidgets.dart';

class SelectSemisterPage extends StatefulWidget {
  const SelectSemisterPage({ Key? key }) : super(key: key);

  @override
  State<SelectSemisterPage> createState() => _SelectSemisterPageState();
}

class _SelectSemisterPageState extends State<SelectSemisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: StudyBuddyAppBar(
            title: "Choose Semister",
          )),      
    );
  }
}