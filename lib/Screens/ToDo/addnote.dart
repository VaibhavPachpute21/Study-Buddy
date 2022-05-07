import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNote extends StatefulWidget {
  const AddNote({ Key? key }) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  late String title;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GFButton(
            color: Colors.blue,
            text: "Save",
            textStyle: GoogleFonts.robotoMono(fontSize: 20 ),
            padding: EdgeInsets.only(right:8 ),
            onPressed: (){
              saveNote();
          })
        ],
      ), 

      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(
              12.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 12.0,
                ),
                //
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: "Title",
                        ),
                        style: TextStyle(
                          fontSize: 32.0,
                          fontFamily: "lato",
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (_val) {
                         title=_val;
                        },
                      ),
                      //
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        padding: const EdgeInsets.only(top: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: "Note Description",
                          ),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "lato",
                          ),
                          onChanged: (_val) {
                           description=_val;
                          },
                          maxLines: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),     
    );
  }

  saveNote(){
    print(title+" "+ description);
  }


}