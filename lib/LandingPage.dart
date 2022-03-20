import 'package:flutter/material.dart';
import 'package:study_buddy/AppTheme.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/Home/HomePage.dart';
import 'package:study_buddy/Screens/ToDoListPage.dart';
import 'package:study_buddy/Screens/YTVideoPage.dart';

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
      appBar: AppBar(
        elevation: 0,
        title:Text( "Study Buddy",style: AppTheme.appbarHeading,) ,
      ),
      body: Center(
        child: _widgetOption.elementAt(_currentIndex),
      ),
      bottomNavigationBar:_buildBottomBar(),
     // bottomNavigationBar: bottomNav(),
    );
  }

Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: Colors.blue,
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
