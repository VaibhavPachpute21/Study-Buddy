import 'package:flutter/material.dart';

class StudyBuddyAppBar extends StatefulWidget {
  const StudyBuddyAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _StudyBuddyAppBarState createState() => _StudyBuddyAppBarState();
}

class _StudyBuddyAppBarState extends State<StudyBuddyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        widget.title,
      ),
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      )),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(String) onSelectionChanged;
  const MultiSelectChip(this.reportList, {required this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(1.0),
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
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          children: _buildChoiceList(),
        ),
      ),
    );
  }
}

class StudyBuddyHorizontalist extends StatefulWidget {
  const StudyBuddyHorizontalist({ Key? key }) : super(key: key);

  @override
  _StudyBuddyHorizontalistState createState() => _StudyBuddyHorizontalistState();
}

class _StudyBuddyHorizontalistState extends State<StudyBuddyHorizontalist> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    padding: const EdgeInsets.all(5),
                    itemBuilder: (contex, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 100,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Book $index"),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                      );
                    }),
              );
  }
}
