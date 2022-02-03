import 'package:flutter/material.dart';

class StudyBuddyAppBar extends StatefulWidget {
  const StudyBuddyAppBar({Key? key,required this.title}) : super(key: key);
  final title;
  @override
  _StudyBuddyAppBarState createState() => _StudyBuddyAppBarState();
}

class _StudyBuddyAppBarState extends State<StudyBuddyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
    title: Text("${widget.title}",),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5),)),
    );
  }
}



class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(String) onSelectionChanged;

  MultiSelectChip(this.reportList, {required this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;

              widget.onSelectionChanged(selectedChoice);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        children: _buildChoiceList(),
      ),
    );
  }
}


