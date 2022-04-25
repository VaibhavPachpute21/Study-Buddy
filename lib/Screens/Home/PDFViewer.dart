import 'package:flutter/material.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PDFViewerPage extends StatefulWidget {
  final String url;
  const PDFViewerPage({required this.url});
  @override
  _PDFViewerPage createState() => _PDFViewerPage();
}

class _PDFViewerPage extends State<PDFViewerPage> {

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: StudyBuddyAppBar(
              title: "Question Paper",
            )),
      body: SfPdfViewer.network(
        "${widget.url}",
        //"https://raw.githubusercontent.com/VaibhavPachpute21/PDFs/main/Bhagwad%20Geeta%20In%20Marathi_pdfa.pdf",
        key: _pdfViewerKey,
      ),
    );
  }
}



