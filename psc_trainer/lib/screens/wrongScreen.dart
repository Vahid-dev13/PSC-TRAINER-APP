import 'package:flutter/material.dart';
import 'package:psc_trainer/const.dart';
import 'package:psc_trainer/models/question.dart';
import 'package:psc_trainer/widgets/subwidgets/answerCard.dart';
import '../widgets/questionCard.dart';


class WrongScreen extends StatelessWidget {
  List<Questions> wlist;
  WrongScreen({this.wlist});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baColor ,
        leading:
        IconButton(
          color: Colors.black,
          padding: EdgeInsets.only(left: 10),
          icon:Icon( Icons.arrow_back),
          onPressed:()=>Navigator.of(context).pop()
          ),
      ),

      backgroundColor: baColor,
      body: Container(
          child: ListView.builder(
              itemBuilder: (context,index)=>AnswerCard(question: wlist[index],),
            itemCount: wlist.length,

          ),
      ),
    );
  }
}
