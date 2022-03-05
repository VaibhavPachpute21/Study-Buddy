import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:webview_flutter/webview_flutter.dart';



class StudyBuddyWebView extends StatefulWidget {

  const StudyBuddyWebView({ Key? key,  }) : super(key: key);

  @override
  _StudyBuddyWebViewState createState() => _StudyBuddyWebViewState();
}

class _StudyBuddyWebViewState extends State<StudyBuddyWebView> {

  final _key = UniqueKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Column(
        
          children: [
            SizedBox(
              height:25,
            ),
            Expanded(
                child: WebView(
                 onProgress: (progress){
                   print(progress);
                   },
                   zoomEnabled: true,
                   onWebResourceError: (error){
                     GFToast.showToast("Error while fetching resource...", context,toastPosition:GFToastPosition.BOTTOM  );
                   },
                    key: _key,
                    navigationDelegate: (NavigationRequest request){
                      return  NavigationDecision.prevent;
                    },
                    javascriptMode: JavascriptMode.disabled,
                    initialUrl:"https://drive.google.com/file/d/1Zj2dcKG5TZ0PQdMexJVx8NH5yFk7xS8W/view?usp=sharing"))
          ],
        ),
    );
  }
}