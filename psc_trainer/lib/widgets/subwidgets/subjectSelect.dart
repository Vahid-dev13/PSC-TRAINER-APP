import 'package:flutter/material.dart';
import 'package:psc_trainer/models/exams.dart';
import 'package:psc_trainer/const.dart';

class SubjectSelect extends StatefulWidget {
  final subject =examtopic;
  int index;
  Function change;
  SubjectSelect({this.index,this.change});

  @override
  _SubjectSelectState createState() => _SubjectSelectState();
}

class _SubjectSelectState extends State<SubjectSelect> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(11),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,i)=>GestureDetector(
          onTap:
              (){
            widget.change(i);
                            setState(() {
                              selected=i;
                            });
                          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: i == selected? pColor.withOpacity(.4):Colors.transparent,
                borderRadius: BorderRadius.circular(11)
            ),
            child: Text(widget.subject[widget.index][i].toString(),style: TextStyle(
                color: Colors.black54
            ),),
          ),
        ),
        itemCount: widget.subject[widget.index].length,
      ),
    );
  }
}
