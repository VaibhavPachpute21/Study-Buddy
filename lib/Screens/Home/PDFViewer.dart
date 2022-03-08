import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PDFViewerPage extends StatefulWidget {
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
      appBar: AppBar(
        title: const Text('Study Buddy'),
      ),
      body: SfPdfViewer.network(

        "https://raw.githubusercontent.com/VaibhavPachpute21/PDFs/main/Bhagwad%20Geeta%20In%20Marathi_pdfa.pdf",
        key: _pdfViewerKey,
      ),
    );
  }
}



