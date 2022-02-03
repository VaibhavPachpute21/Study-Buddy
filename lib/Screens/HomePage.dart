import 'package:flutter/material.dart';
import 'package:study_buddy/CommonWidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> departmentList = ["IT","COMP","CIVIL","MECHANICAL","ELECTRICAL"];

  String selectedDept="";
  List<String> yearOfStudy = ["Fist Year", "Second Year", "Third Year", "Last Year"];

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:const  PreferredSize(
          preferredSize:  Size.fromHeight(50), child: StudyBuddyAppBar(title:"Home" ,)),
      body: ListView(
        children: [Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Select Stream and Year of Study")),
            gridContainers(),
            MultiSelectChip(
              departmentList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedDept = selectedList;
                  print(selectedList);
                });
              },
            ),
          ],
        )],

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
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: yearOfStudy.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: (){
                  print(yearOfStudy[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(yearOfStudy[index]),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            }),
      ),
    );
  }
}






