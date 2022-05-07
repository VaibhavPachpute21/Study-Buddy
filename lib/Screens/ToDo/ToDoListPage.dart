import 'package:flutter/material.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/ToDo/addnote.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final _inactiveColor = Colors.grey;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => AddNote(),
            ),
          )
              .then((value) {
            print("Calling Set  State !");
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white70,
        ),
        backgroundColor: Colors.grey[700],
      ),
      body: Center(
        child:Text("Work in progress...")
      ),
    );
  }


  _choicechip() {
    return CustomChoiceChip(
      animationDuration: Duration(milliseconds: 350),
      selectedItemOverlayColor: Colors.lightBlue.shade100,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      onItemSelected: (index) {
        setState(() => _currentIndex = index);
      },
      items: <CustomChoiceChipBarItem>[
        /*-------------- Build tabs here -----------------*/
        CustomChoiceChipBarItem(
            title: 'COMPUTER/IT',
            icon: Image.asset("./assets/images/cse.png",),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'CIVIL',
            icon: Image.asset("./assets/images/ce.png"),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'MECHANICAL',
            icon: Image.asset("./assets/images/me.png"),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'ELECTRICAL',
            icon: Image.asset("./assets/images/ee.png"),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'ELECTRONIC',
            icon: Image.asset("./assets/images/ece.png"),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
      ],
    );
  }




}

