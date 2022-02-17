import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class StudyBuddyPDFViewer extends StatelessWidget {
  StudyBuddyPDFViewer(this.link);
  final String link;

  loadDocument() async {
    try {
      PDFDocument document;
      document = await PDFDocument.fromURL(link);
      return document;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(link);
    return SafeArea(
      child: FutureBuilder(
        future: loadDocument(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final Color _whiteCream = Color.fromRGBO(250, 245, 228, 1);
            final Color _darkBlue = Color.fromRGBO(0, 68, 69, 1);
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/boi.jpg",
                      color: _whiteCream,
                      height: 32.0,
                      width: 32.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('বই বাজার')
                  ],
                ),
                backgroundColor: _darkBlue,
              ),
              body: PDFViewer(
                document: snapshot.data,
                lazyLoad: false,
                scrollDirection: Axis.vertical,
                zoomSteps: 5,
              ),
            );
          }
          return Scaffold(
            body: Container(
              color: Color.fromRGBO(250, 245, 228, 1),
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(250, 245, 228, 1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}