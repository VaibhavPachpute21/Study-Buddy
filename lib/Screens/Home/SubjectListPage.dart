import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_buddy/APIs/Api.dart';
import 'package:study_buddy/AppTheme.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/Home/StudyMaterialPage.dart';
import 'package:study_buddy/global.dart' as global;

class SubjectListPage extends StatefulWidget {
  final String? dept;
  final String? year;
  const SubjectListPage({Key? key, required this.dept, required this.year})
      : super(key: key);

  @override
  _SubjectListPageState createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
  bool isLoading = true;
  List<String> semister = [""];
  String sem = "";
  List<dynamic> subjectsData = [];
  List<dynamic> booksData = [];
  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    widget.year == "First Year"
        ? setState(() {
            semister = ["First Semester", "Second Semester"];
            sem = semister[0];
          })
        : widget.year == "Second Year"
            ? setState(() {
                semister = ["Third Semester", "Fourth Semester"];
                sem = semister[0];
              })
            : widget.year == "Third Year"
                ? setState(() {
                    semister = ["Fifth Semester", "Sixth Semester"];
                    sem = semister[0];
                  })
                : setState(() {
                    semister = ["Seventh Semester", "Eight Semester"];
                    sem = semister[0];
                  });
    getApisData();
  }

  getApisData() async {
    var res = await StudyBuddyApis().getAllData(widget.dept, widget.year, sem);
    try {
      if (res != null) {
        setState(() {
          subjectsData = [];
        });
        subjectsData.addAll(res);
        print(global.syllabus);
        print(res.length);
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading=false;
          subjectsData=[];
        });

      }
    } catch (e) {
      print("err");
      print(e);
      print(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: StudyBuddyAppBar(
            title: "Subjects",
          )),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          :subjectsData== null ? Center(child: Text("Something Went wrong...!"),): Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("./assets/images/bg.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "-: " +
                          widget.year.toString().toUpperCase() +
                          " " +
                          widget.dept.toString() +
                          " :-",
                      style: AppTheme.pageHeading1,
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50)),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 20)),
                      hint: Text('$sem',
                          style: GoogleFonts.lato(color: Colors.white)),
                      isExpanded: true,
                      items: semister.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(
                            value,
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          sem = val.toString();
                          isLoading = true;
                        });
                        getApisData();
                        print(val);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  gridContainers(),
                ],
              ),
            ),
    );
  }

  Widget gridContainers() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: subjectsData.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    booksData = [];
                  });
                  booksData.addAll(subjectsData[index]["books"]);
                  var subject = subjectsData[index]["subject"];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudyMaterialListPage(
                              books: booksData, subjectName: subject)));
                },
                child: Container(
                  padding: EdgeInsets.only(left: 5, right: 2),
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      subjectsData[index]["subject"].toString(),
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
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
