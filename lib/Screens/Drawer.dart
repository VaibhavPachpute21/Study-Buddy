// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:study_buddy/Screens/Home/HomePage.dart';
import 'package:study_buddy/Screens/YTVideo/YTVideoPage.dart';
import 'package:study_buddy/auth/login.dart';


class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  TextStyle h2TextStyle =
      TextStyle(fontSize: 16, fontFamily: "lato", fontWeight: FontWeight.w300);

  TextStyle h1TextStyle =
      TextStyle(fontSize: 18, fontFamily: "lato", fontWeight: FontWeight.w600);
   FirebaseAuth auth = FirebaseAuth.instance;
  String url='';

final defaultSizedBox=SizedBox(height: 5,);


@override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext ctxt) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,    ),
              child: Column(
                children:  <Widget>[
                 
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child:CircleAvatar(backgroundImage:NetworkImage("${auth.currentUser!.photoURL}"),radius: 35, ),
                    ),
                  ),
                  Text(
                    'Study Buddy',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  )
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5,top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${auth.currentUser!.displayName}" , style: h1TextStyle),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          defaultSizedBox,
                          InkWell(
                            onTap: (){
                            },
                            child: Row(
                              children: [
                                Icon(Icons.home_outlined),
                                Text(
                                  "Home",
                                  style: h1TextStyle,
                                )
                              ],
                            ),
                          ),
                          defaultSizedBox,
                          InkWell(
                            onTap: (){},
                            child: Row(
                              children: [
                                Icon(Icons.note_add_outlined),
                                Text(
                                  "Add Notes",
                                  style: h1TextStyle,
                                )
                              ],
                            ),
                          ),
                          defaultSizedBox,
                          InkWell(
                            onTap: (){},
                            child: Row(
                              children: [
                                Icon(Icons.share),
                                Text(
                                  "Share",
                                  style: h2TextStyle,
                                )
                              ],
                            ),
                          ),
                          defaultSizedBox,
                          InkWell(
                            onTap: (){},

                            child: Row(
                              children: [
                                Icon(Icons.feedback),
                                Text(
                                  "Feedback",
                                  style: h2TextStyle,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
       
              FirebaseAuth.instance.currentUser==null?Container(
                margin: EdgeInsets.only(top: 10),
                child: GFButton(
                  color: Colors.transparent,
                  child:Row(children: [
                    Icon(Icons.login),
                    SizedBox(width: 3,),
                    Text("Login",style: h2TextStyle,)
                  ],) ,
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                      setState(() {});
                    },
                    ),
              ):
              Container(
                margin: EdgeInsets.only(top: 10),
                child: GFButton(
                  color: Colors.transparent,
                  child:Row(children: [
                    Icon(Icons.logout),
                    SizedBox(width: 3,),
                    Text("Logout",style: h2TextStyle,)
                  ],) ,
                    onPressed: () {
                      logout(context);
                      setState(() {});
                    },
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

    // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }

}
