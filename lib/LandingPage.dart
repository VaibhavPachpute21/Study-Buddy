import 'package:flutter/material.dart';
import 'package:study_buddy/Screens/HomePage.dart';
import 'package:study_buddy/Screens/ToDoListPage.dart';
import 'package:study_buddy/Screens/YTVideoPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LandingPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOption = [
    HomePage(),
    YTVideoPage(),
    ToDoListPage()
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    return BottomNavigationBar(

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video), label: "YT Video"),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined),
          label: "My ToDo's",
        ),
      ],
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.shifting,
      currentIndex: _selectedIndex,
      iconSize: 30,
      onTap: _onItemTapped,
      elevation: 5,
    );
  }
}
