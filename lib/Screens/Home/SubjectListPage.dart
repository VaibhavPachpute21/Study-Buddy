import 'package:flutter/material.dart';
import 'package:study_buddy/AppTheme.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/Home/StudyMaterialPage.dart';


class SubjectListPage extends StatefulWidget {
  final String? dept;
  final String? year;
  const SubjectListPage({Key? key, required this.dept, required this.year})
      : super(key: key);

  @override
  _SubjectListPageState createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {

List<String> semister=[];
   
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
           
               Container(
                 margin: EdgeInsets.only(left: 20,right: 20),
                 decoration: BoxDecoration(
                   border: Border.all(),
                   borderRadius: BorderRadius.circular(50)
                 ),
                 child: DropdownButtonFormField<String>(
                       decoration: InputDecoration(
                        border: InputBorder.none,
                         contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 20)

                        ),
                      hint: Text('Select Sender', ),
                      isExpanded: true,
                      items: semister.map((String value) {
                        return DropdownMenuItem<String>(

                          value: value,
                          child: new Text(

                            value,
                           
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {print(val);},
                    ),
               ),
               
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
