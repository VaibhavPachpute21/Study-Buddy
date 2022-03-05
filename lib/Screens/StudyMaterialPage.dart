import 'package:flutter/material.dart';
import 'package:study_buddy/AppTheme.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/PDFViewer.dart';
import 'package:study_buddy/Screens/WebViewScreen.dart';
import 'package:study_buddy/Screens/pdfView2.dart';

class StudyMaterialListPage extends StatefulWidget {
  final int subject;
  const StudyMaterialListPage({Key? key, required this.subject})
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
              Center(child: Text( "Subject at index " + widget.subject.toString(),style: AppTheme.pageHeading1, )),
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
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          padding:  EdgeInsets.all(5),
          itemBuilder: (contex, index) {
            return Padding(
              padding:  EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFViewerPage()) );
                },
                child: SizedBox(
                  width: 100,
                  child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:  EdgeInsets.all(2.0),
                      child: Text("Book name at index value $index",style: AppTheme.containText1,),
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
          itemCount: 4,
          padding: const EdgeInsets.all(5),
          itemBuilder: (contex, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFViewerPage()) );
                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFViewerPage2()) );
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

}
