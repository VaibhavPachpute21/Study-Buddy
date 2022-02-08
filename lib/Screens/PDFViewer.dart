import 'package:flutter/material.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class StudyBuddyPDFViewer extends StatefulWidget {
  const StudyBuddyPDFViewer({ Key? key }) : super(key: key);

  @override
  _StudyBuddyPDFViewerState createState() => _StudyBuddyPDFViewerState();
}

class _StudyBuddyPDFViewerState extends State<StudyBuddyPDFViewer> {
  bool _isLoading = true;
  late PDFDocument _pdf;

  void _loadFile() async {
    // Load the pdf file from the internet
    _pdf = await PDFDocument.fromURL(
        'https://www.kindacode.com/wp-content/uploads/2021/07/test.pdf');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFile();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: StudyBuddyAppBar(
            title: "PDF Screen",
          )),
          body:Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: _pdf)),
      
    );
  }
}