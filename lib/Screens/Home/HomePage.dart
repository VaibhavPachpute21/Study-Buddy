import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:study_buddy/AppTheme.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/Home/SubjectListPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> departmentList = [
    "COMPUTER",
    "CIVIL",
    "MECHANICAL",
    "ELECTRICAL",
    "ELECTRONIC"
  ];
   List<String> yearOfStudy = [
    "First Year",
    "Second Year",
    "Third Year",
    "Last Year"
  ];
    final _inactiveColor = Colors.transparent;
    final _iconColor=Colors.black;
    final _activeColor=Colors.black;
  int _currentIndex = 0;
  String? selectedYear;
  String? selectedDept;
 
 @override
  void initState() {
    selectedDept=departmentList[_currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Column(
             children: [
               Text("Selected Stream ",style:AppTheme.pageHeading1,),
               Text(departmentList[_currentIndex].toString(),style:AppTheme.pageHeading1)
             ],
           ),
          Column(
            children: [
              gridContainers(),
              _choicechip(),
            ],
          ),
                      
        ],
      ),
    );
  }

  Widget gridContainers() {
    return SizedBox(
      height: 260,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(

            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: yearOfStudy.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
              
                onTap: () {
                  if (selectedDept != null) {
                    setState(() {
                      selectedYear = yearOfStudy[index];
                    });
                    showToastMSG(selectedDept.toString()+" "+selectedYear.toString());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contex) => SubjectListPage(
                                dept: selectedDept, year: selectedYear)));
                  } else {
                    showToastMSG("First Select Department");
                  }

                  print(yearOfStudy[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(yearOfStudy[index],style: AppTheme.containText1, ),
                  decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            }),
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
        print(departmentList[_currentIndex]);
        selectedDept=departmentList[_currentIndex];
      },
      items: <CustomChoiceChipBarItem>[
        CustomChoiceChipBarItem(
            title: 'COMPUTER',
            icon: Image.asset("./assets/images/cse.png",color: _iconColor,),
            activeColor: _activeColor,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'CIVIL',
            icon: Image.asset("./assets/images/ce.png",color: _iconColor,),
            activeColor: _activeColor,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'MECHANICAL',
            icon: Image.asset("./assets/images/me.png",color: _iconColor,),
            activeColor: _activeColor,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'ELECTRICAL',
            icon: Image.asset("./assets/images/ee.png",color: _iconColor,),
            activeColor: _activeColor,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'ELECTRONIC',
            icon: Image.asset("./assets/images/ece.png",color: _iconColor,),
            activeColor: _activeColor,
            inactiveColor: _inactiveColor),
      ],
    );
  }


  showToastMSG(msg) {
    return GFToast.showToast("$msg", context,
        toastPosition: GFToastPosition.BOTTOM);
  }

}
