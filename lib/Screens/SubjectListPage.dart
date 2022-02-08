import 'package:flutter/material.dart';
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
            title: "Subjects",
          )),
      body: ListView(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(5)),
            width: MediaQuery.of(context).size.width,
            height: 25,
            child: Center(
                child: Text(
                    widget.dept.toString() + " " + widget.year.toString())),
          ),
          gridContainers(),
        ],
      ),
    );
  }

  Widget gridContainers() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .8,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 12,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>StudyMaterialListPage(subject:index) ) );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Subject $index"),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
