import 'package:flutter/material.dart';

class ExamList extends StatefulWidget {
  int selected;
  Function change;
  ExamList({this.selected,this.change});

  @override
  _ExamListState createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  List exams = ['Syllabus wise test','Psc mock test','News','psc home page'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(11),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,i)=>GestureDetector(
            onTap: (){
              setState(() {
                widget.selected=i;
                widget.change(i);
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 19),
              padding: EdgeInsets.symmetric(horizontal: 19),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: i == widget.selected? Colors.white.withOpacity(.4):Colors.transparent,
                borderRadius: BorderRadius.circular(11)
              ),
              child: Text(exams[i],style: TextStyle(
                color: Colors.white
              ),),
            ),
          ),
        itemCount: exams.length,
      ),
    );
  }
}
