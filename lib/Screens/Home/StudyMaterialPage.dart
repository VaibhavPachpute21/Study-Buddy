import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_buddy/AppTheme.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/Home/PDFViewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:study_buddy/global.dart' as global;

class StudyMaterialListPage extends StatefulWidget {
  final List<dynamic> books;
  final String subjectName;
  const StudyMaterialListPage({Key? key, required this.books, required this.subjectName})
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
            title: "Study Material",
          )),
      body: Column(
            children: [
              Container(padding: EdgeInsets.only(left: 2,right: 2, top: 5,bottom: 5),
                child: Text("-: "+ widget.subjectName.toString()+" :-",style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic ), )),
               
              booksList(),
              //  Text("Notes",style: AppTheme.pageHeading2,),
              // notesList(),
             
              Container( child: InkWell(
                child:GFButton(
                  size: 50,
                  
                  color: Colors.amber.shade200,
                  textColor: Colors.black,
                  text: "View Syllabus",icon: Icon(Icons.description_outlined),
                  onPressed: (){
                  opentDriveLink(global.syllabus.toString());
                })
                 
              ),),
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
              padding:  EdgeInsets.all(3.0),
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
                      padding:  EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.books[index]["name"].toString(),style:GoogleFonts.ibmPlexSans(),overflow: TextOverflow.ellipsis,maxLines: 5,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            IconButton(onPressed: (){}, icon:Icon(Icons.download),tooltip: "download file", ),
                            IconButton(onPressed: (){
                              opentDriveLink(widget.books[index]["url"]);
                            }, icon:Icon(Icons.open_in_new_rounded),tooltip: "open file",),
                          ],)
                        ],
                      ),
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
