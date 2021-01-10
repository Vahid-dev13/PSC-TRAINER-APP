import 'package:flutter/material.dart';
import 'package:psc_trainer/models/question.dart';
import 'package:psc_trainer/widgets/subwidgets/answerCard.dart';
import '../const.dart';
class ReadScreen extends StatefulWidget {

  String topic;
  List<Questions> realQ;

  ReadScreen({this.topic,this.realQ});

  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  int check = 0;

  List<Questions> gk;

  List<Questions> maths;

  List<Questions> english;

  List<Questions> renaisance;

  List<Questions> language;

  List<Questions> science;

  List<Questions> subject;

   topicselect(int val){
     switch(val){
       case 1:
         subject=gk;
         break;
       case 2:
         subject=maths;
         break;
       case 3:
         subject=english;
         break;
       case 4:
         subject=science;
         break;
       case 5:
         subject=language;
         break;
       case 6:
         subject=renaisance;
         break;

     }

     setState(() {
       check=1;
     });


   }

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
        child: ListView.builder(itemBuilder: (context,index)=>AnswerCard(question: (widget.realQ..shuffle()).first,),
            itemCount: widget.realQ.length,
        ),
      )
    );
  }
}
