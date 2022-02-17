import 'package:flutter/material.dart';
import 'package:study_buddy/CommonWidgets.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          child: StudyBuddyAppBar(title: "My ToDo's"),
          preferredSize: Size.fromHeight(50)),
      body: Container(),
    );
  }
}
