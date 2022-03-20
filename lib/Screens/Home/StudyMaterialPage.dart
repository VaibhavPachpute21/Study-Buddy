import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:study_buddy/AppTheme.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/Home/PDFViewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:study_buddy/global.dart' as global;

class StudyMaterialListPage extends StatefulWidget {
  final List<dynamic> books;
  final String subjectName;
  const StudyMaterialListPage(
      {Key? key, required this.books, required this.subjectName})
      : super(key: key);

  @override
  _StudyMaterialListPageState createState() => _StudyMaterialListPageState();
}

class _StudyMaterialListPageState extends State<StudyMaterialListPage> {
  bool loading = false;
  double progress = 0;
  final Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: StudyBuddyAppBar(
              title: "Study Material",
            )),
        body: loading
            ? Container(
              padding: EdgeInsets.only(left: 5,right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Downloading..."),
                    SizedBox(height: 10,),
                    LinearProgressIndicator(
                      minHeight: 15,
                      value: progress,
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Container(
                      padding:
                          EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
                      child: Text(
                        "-: " + widget.subjectName.toString() + " :-",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      )),

                  booksList(),
                  //  Text("Notes",style: AppTheme.pageHeading2,),
                  // notesList(),
                  SizedBox(height: 10,),
                  Container(
                    child: InkWell(
                        child: GFButton(
                            size: 50,
                            color: Colors.amber.shade200,
                            textColor: Colors.black,
                            text: "View Syllabus",
                            icon: Icon(Icons.description_outlined),
                            onPressed: () {
                              opentDriveLink(global.syllabus.toString());
                            })),
                  ),
                ],
              ));
  }

  booksList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          padding: EdgeInsets.all(5),
          itemBuilder: (contex, index) {
            return Padding(
              padding: EdgeInsets.all(3.0),
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
                      padding: EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.books[index]["name"].toString(),
                            style: GoogleFonts.ibmPlexSans(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  downloadFile(
                                      widget.books[index]["url"].toString(),
                                      widget.books[index]["name"]);
                                },
                                icon: Icon(Icons.download),
                                tooltip: "download file",
                              ),
                              IconButton(
                                onPressed: () {
                                  opentDriveLink(widget.books[index]["url"]);
                                },
                                icon: Icon(Icons.open_in_new_rounded),
                                tooltip: "open file",
                              ),
                            ],
                          )
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
                      child: Text(
                        "NotesPDF name at index value $index",
                       
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

  opentDriveLink(url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  downloadFile(url, name) async {
    var docId = url
        .toString()
        .replaceAll("https://drive.google.com/file/d/", "")
        .replaceAll("/view?usp=sharing", "");
    print(docId);
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo("$docId", "$name.pdf");
    if (downloaded) {
      print("File Downloaded");
      GFToast.showToast("File Downloaded", context);
    } else {
      print("Problem Downloading File");
      GFToast.showToast("Problem Downloading File", context);
    }
    setState(() {
      loading = false;
    });
  }

  Future<bool> saveVideo(String docId, String fileName) async {
    String url = "https://drive.google.com/uc?id=$docId&export=download";
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
      File saveFile = File(directory.path + "/$fileName");
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
}
