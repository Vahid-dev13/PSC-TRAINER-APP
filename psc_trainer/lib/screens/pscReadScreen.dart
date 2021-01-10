import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/subwidgets/answerCard.dart';
import 'package:psc_trainer/const.dart';


class PscReadScreen extends StatelessWidget {

  List<Questions> realquestions;

  PscReadScreen({this.realquestions});



  @override
  Widget build(BuildContext context) {
    return/* widget.topic=='General Knowledge'&&check==0? topicselect(1):
    widget.topic=='Simple Arithmetic'&&check==0? topicselect(2):
    widget.topic=='English'&&check==0? topicselect(3):
    widget.topic=='Science'&&check==0? topicselect(4):
    widget.topic=='Language'&&check==0? topicselect(5):
    widget.topic=='Renaissance'&&check==0? topicselect(6):*/
      Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: baColor ,
            leading:
            IconButton(
                color: Colors.black,
                padding: EdgeInsets.only(left: 10),
                icon:Icon( Icons.arrow_back),
                onPressed:()=> Navigator.pop(context)),
          ),

          backgroundColor: baColor,
          body: Container(
            child: ListView.builder(itemBuilder: (context,index)=>AnswerCard(question: (realquestions..shuffle()).first,),
              itemCount: realquestions.length,
            ),
          )
      );
  }
}

