import 'package:flutter/material.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/HomeScreens.dart/HomePage.dart';
import 'package:study_buddy/Screens/HomeScreens.dart/ToDoListPage.dart';
import 'package:study_buddy/Screens/HomeScreens.dart/YTVideoPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LandingPage> {
  int _selectedIndex = 0;
  int _currentIndex = 0;
  final _inactiveColor = Colors.grey;
  final List<Widget> _widgetOption = [
    const HomePage(),
    const YTVideoPage(),
    const ToDoListPage()
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
        child: _widgetOption.elementAt(_currentIndex),
      ),
      bottomNavigationBar:_buildBottomBar(),
     // bottomNavigationBar: bottomNav(),
    );
  }

  Widget odlBottomNav() {
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

Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.ondemand_video),
          title: const Text('YT Video'),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.list_alt_outlined),
          title: const Text(
            "MyToDo's",
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
         ),
      ],
    );
  }


}
