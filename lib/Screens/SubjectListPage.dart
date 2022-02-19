import 'package:flutter/material.dart';
import 'package:study_buddy/AppTheme.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/StudyMaterialPage.dart';

class SubjectListPage extends StatefulWidget {
  final String? dept;
  final String? year;
  const SubjectListPage({Key? key, required this.dept, required this.year})
      : super(key: key);

  @override
  _SubjectListPageState createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: StudyBuddyAppBar(
            title: "Choose Course",
          )),
      body: Column(
        children: [
          Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Subjects for:\n"+widget.year.toString() + " " + widget.dept.toString(),style: AppTheme.pageHeading1,),
              )),
          
          gridContainers(),
        ],
        
      ),
    );
  }

  Widget gridContainers() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        // decoration: BoxDecoration(
        //     border: Border.all(
        //       //color: Colors.grey,
        //     ),
        //     borderRadius: BorderRadius.circular(15)),
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: 12,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>StudyMaterialListPage(subject:index) ) );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Subject $index",style: TextStyle(fontFamily: "roboto"),),
                  decoration: BoxDecoration(
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            }),
      ),
    );
  }
}
