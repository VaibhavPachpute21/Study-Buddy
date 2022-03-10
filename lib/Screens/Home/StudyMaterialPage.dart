import 'package:flutter/material.dart';
import 'package:study_buddy/AppTheme.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/Home/PDFViewer.dart';
import 'package:url_launcher/url_launcher.dart';

class StudyMaterialListPage extends StatefulWidget {
  final List<dynamic> books;
  const StudyMaterialListPage({Key? key, required this.books})
      : super(key: key);

  @override
  _StudyMaterialListPageState createState() => _StudyMaterialListPageState();
}

class _StudyMaterialListPageState extends State<StudyMaterialListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: StudyBuddyAppBar(
            title: "Course Material",
          )),
      body: Column(
            children: [
              Center(child: Text( "Subject",style: AppTheme.pageHeading1, )),
               Text("Books",style:AppTheme.pageHeading2,),
              booksList(),
               Text("Notes",style: AppTheme.pageHeading2,),
              notesList()
            ],
          )
      );
  }

  booksList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          padding:  EdgeInsets.all(5),
          itemBuilder: (contex, index) {
            return Padding(
              padding:  EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                   opentDriveLink(widget.books[index]["url"]);
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFViewerPage()) );
                },
                child: SizedBox(
                  width: 150,
                  child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:  EdgeInsets.all(2.0),
                      child: Text(widget.books[index]["name"].toString(),style: AppTheme.containText1,),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            );
          }),
    );
  }

  notesList() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          padding: const EdgeInsets.all(5),
          itemBuilder: (contex, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  opentDriveLink(widget.books[index]["url"]);
                },
                child: SizedBox(
                  width: 100,
                  child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("NotesPDF name at index value $index",style: AppTheme.containText2,),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            );
          }),
    );
  }

  opentDriveLink(url) async{
    // const url = 'https://drive.google.com/file/d/1Zj2dcKG5TZ0PQdMexJVx8NH5yFk7xS8W/view?usp=sharing';

              if (await canLaunch(url)) {
                await launch(url, forceSafariVC: false);
              } else {
                throw 'Could not launch $url';
              }
  }

}
