// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:study_buddy/CommonWidgets.dart';
import 'package:study_buddy/Screens/ToDo/addnote.dart';
import 'package:study_buddy/Screens/ToDo/viewnote.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {

  final _inactiveColor = Colors.grey;
  int _currentIndex = 0;
    CollectionReference ref = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection("notes");

  List<Color> myColors = [
    Colors.yellow,
    Colors.red ,
    Colors.green,
    Colors.deepPurple,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
    Colors.tealAccent,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => AddNote(),
            ),
          )
              .then((value) {
            print("Calling Set  State !");
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white70,
        ),
        backgroundColor: Colors.grey[700],
      ),
      body:FutureBuilder<QuerySnapshot>(
        future: ref.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.docs.length == 0 || snapshot.data?.docs==null) {
              return Center(
                child: Text(
                  "You have no saved Notes !",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              );
            }

            return   GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Random random = new Random();
                Color bg = myColors[random.nextInt(6)];
                Map data = snapshot.data!.docs[index].data() as Map;//snapshot.data!.docs[index].data() as Map;
                DateTime mydateTime = data['created'].toDate();
                String formattedTime =
                    DateFormat.yMMMd().add_jm().format(mydateTime);

                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) => ViewNote(
                          data,
                          formattedTime,
                          snapshot.data!.docs[index].reference,
                        ),
                      ),
                    )
                        .then((value) {
                      setState(() {});
                    });
                  },
                  child: Card(
                    color: bg,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data['title']}",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: "lato",
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          //
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              formattedTime,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "lato",
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("Loading..."),
            );
          }
        },
      ),
    
    );
  }

  _choicechip() {
    return CustomChoiceChip(
      animationDuration: Duration(milliseconds: 350),
      selectedItemOverlayColor: Colors.lightBlue.shade100,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      onItemSelected: (index) {
        setState(() => _currentIndex = index);
      },
      items: <CustomChoiceChipBarItem>[
        /*-------------- Build tabs here -----------------*/
        CustomChoiceChipBarItem(
            title: 'COMPUTER/IT',
            icon: Image.asset(
              "./assets/images/cse.png",
            ),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'CIVIL',
            icon: Image.asset("./assets/images/ce.png"),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'MECHANICAL',
            icon: Image.asset("./assets/images/me.png"),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'ELECTRICAL',
            icon: Image.asset("./assets/images/ee.png"),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
        CustomChoiceChipBarItem(
            title: 'ELECTRONIC',
            icon: Image.asset("./assets/images/ece.png"),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor),
      ],
    );
  }

  newBody(){
     CollectionReference ref=FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection("notes");
  return  FutureBuilder<QuerySnapshot>(
             future:ref.orderBy('Time').get(),
                builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                       shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                      Map data= snapshot.data!.docs[index].data() as Map;
                      DateTime mynote_time=data['Time'].toDate();
                      String formattedTime =
                      DateFormat.yMMMd().add_jm().format(mynote_time);
                      return Column(
                        children: [
                          Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                                  child: Text(
                                      "${data['title']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                                  child: Text(
                                    "${data['description']}",
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    formattedTime
                                  ),
                                )
                              ],
                            ),
                            borderOnForeground: true,
                            shadowColor: Colors.blueAccent,
                            color: Colors.grey[100],
                            elevation: 10,
                          ),
                        ],
                      );
                      }
                      );
                }
                else if(snapshot==null){
                  return Text('Please Enter some notes');
                }
                else return Padding(
                  padding: EdgeInsets.fromLTRB(150, 200, 0, 50),
                  child:Text("Noooo"),
                );
                });
  }

  getNotes() {
    CollectionReference ref=FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection("notes");
    var res=ref.get();


  }
}
