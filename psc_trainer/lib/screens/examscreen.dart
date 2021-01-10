

import 'package:flutter/material.dart';
import 'package:psc_trainer/screens/resultScreen.dart';
import '../const.dart';
import '../widgets/questionCard.dart';
import '../models/question.dart';



class ExamScreen extends StatefulWidget {
  String topic;
  int index;
  List<Questions> realquestions;
  ExamScreen({this.index,this.topic,this.realquestions});
   List<Questions> cli=[];
   List<Questions> wlist=[];
   List<Questions> skip=[];
   List<Questions> all=[];
   void _addSkip(Questions skiped){
     skip.add(skiped);
   }

  void _addall(Questions anyone){
    all.add(anyone);
  }

  void _addWrong(Questions wquest){
    wlist.add(wquest);
  }

  void _addCorrect(Questions cQuest){
    cli.add(cQuest);
  }

  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {

  var q;
  Questions ques;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()=> showDialog(
          context: context,
          builder:(context)=> AlertDialog(
            title: Text('Warning',textAlign: TextAlign.center,style: TextStyle(color: Colors.red),),
            content: Container(
              height: 50,
              child: Column(
                children: <Widget>[
                  Text('GO Back To Home?',textAlign: TextAlign.center,style: TextStyle(color:  Colors.black54),),
                  Text('All your answers will be erased!',textAlign: TextAlign.center,style: TextStyle(color:  Colors.black54),),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child:Text('Yes'),
                onPressed: ()=>Navigator.of(context).popUntil(ModalRoute.withName('/detailsScreen')),
              ),
              FlatButton(
                child:Text('No'),
                onPressed:() => Navigator.pop(context, false),
              ),
            ],
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: baColor ,
          leading:
          IconButton(
              color: Colors.black,
              padding: EdgeInsets.only(left: 10),
              icon:Icon( Icons.arrow_back),
              onPressed:()=>showDialog(
                  context: context,
                  builder:(context)=> AlertDialog(
                    title: Text('Warning',textAlign: TextAlign.center,style: TextStyle(color: Colors.red),),
                    content: Container(
                      height: 50,
                      child: Column(
                        children: <Widget>[
                          Text('GO Back To Home?',textAlign: TextAlign.center,style: TextStyle(color:  Colors.black54),),
                          Text('All your results will be erased!',textAlign: TextAlign.center,style: TextStyle(color:  Colors.black54),),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child:Text('Yes'),
                        onPressed: ()=>Navigator.of(context).popUntil(ModalRoute.withName('/detailsScreen')),
                      ),
                      FlatButton(
                        child:Text('No'),
                        onPressed: () => Navigator.pop(context, false),
                      ),
                    ],
                  )
              ),),
        ),
        backgroundColor: baColor,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context,index)=> QuestionCard(question: ques=( widget.realquestions..shuffle()).first,addC:widget._addCorrect,addW: widget._addWrong,skip: widget._addSkip, addall: widget._addall,),
                  itemCount: 25,
              )
            ),
            Container(

              color: pColor,
              child: GestureDetector(
                onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(index:widget.index,wlist: widget.wlist,clist: widget.cli,skiplist: widget.skip,all: widget.all,)));
                    },
                child: FlatButton(
                  onPressed: null,
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Finish and proceed',style: TextStyle(
                            color: baColor,//pColor.withOpacity(.5),
                            fontSize: 20
                          ),),
                          Icon(
                            Icons.arrow_forward,
                              color: baColor
                          )
                        ],
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

