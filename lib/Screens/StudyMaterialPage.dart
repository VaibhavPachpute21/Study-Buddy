import 'package:flutter/material.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/PDFViewer.dart';

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
            title: "Study Materials",
          )),
      body: ListView(
        children: [
          Container(
              child:
                  Center(child: Text("Subject " + widget.subject.toString()))),
          Column(
            children: [
              const Text("Books"),
              const Divider(thickness: 1,),
              booksList(),
              const Text("Notes"),
              notesList()
            ],
          )
        ],
      ),
    );
  }

  booksList() {
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
                onTap: () {},
                child: SizedBox(
                  width: 100,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Book $index"),
                    decoration: BoxDecoration(
                        color: Colors.amber,
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
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>StudyBuddyPDFViewer() ) );
                },
                child: SizedBox(
                  width: 100,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("NotesPDF $index"),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            );
          }),
    );
  }

}
