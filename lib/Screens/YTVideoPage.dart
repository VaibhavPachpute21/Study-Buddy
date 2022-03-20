import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:study_buddy/APIs/Api.dart';
import 'package:study_buddy/AppTheme.dart';


class YTVideoPage extends StatefulWidget {
  const YTVideoPage({Key? key}) : super(key: key);

  @override
  _YTVideoPageState createState() => _YTVideoPageState();
}

class _YTVideoPageState extends State<YTVideoPage> {
  
  //String u = 'https://drive.google.com/file/d/1m5L5oHvyqCjGPnvBqILbokzSNrxetvKy/view?usp=sharing';
  String u ="https://drive.google.com/uc?id=18m2_-JzIBhXHvxajAQ5wQxIr_dAjj-L0&export=download";
         
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;
  late File pdfFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Center(child: Text("Work in progress..."),) 
      // loading
      //     ? Center(
      //         child: LinearProgressIndicator(
      //           minHeight: 10,
      //           value: progress,
      //         ),
      //       )
      //     : Column(
      //         children: [
      //           GFButton(
      //             color: Colors.amber,
      //             text: "Create DIR",
      //             onPressed: () {
      //               downloadFile(u);
      //             },
      //           )
      //         ],
      //       ),
    );
  }



  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          print(directory);
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/StudyBuddy";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      //final filename = url.substring(url.lastIndexOf("/") + 1);
      File saveFile = File(directory.path + "/${DateTime.now()}.pdf");
      print(saveFile.path);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
          });
        });

        if (Platform.isIOS) {
          print("platform IOS");
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile(String u) async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo("$u", "book ${DateTime.now()}.pdf");
    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }
}
