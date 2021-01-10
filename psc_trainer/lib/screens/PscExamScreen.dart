import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psc_trainer/const.dart';
import 'package:psc_trainer/models/question.dart';
import 'package:psc_trainer/screens/examscreen.dart';
import 'package:psc_trainer/widgets/questionCard.dart';
import 'package:psc_trainer/widgets/subwidgets/initialiser.dart';
import 'resultScreen.dart';

class PscExamScreen extends StatefulWidget {
  List<Questions> realquestions;
  PscExamScreen({this.realquestions});

  @override
  _PscExamScreenState createState() => _PscExamScreenState();
}

class _PscExamScreenState extends State<PscExamScreen> {
  List<Questions> clist=[];
  List<Questions> skiplist=[];
  List<Questions> wlist=[];
  List<Questions> all=[];
  bool stop=false;

  @override

  _stop(){
    setState(() {
      stop=true;
    });
  }

  void _addall( Questions q){

    all.add(q);
  }



  void _addSkiplist( Questions q){

    skiplist.add(q);
  }

  void _addWrong(Questions wquest){
    wlist.add(wquest);
  }

  void _addCorrect(Questions cQuest){
    clist.add(cQuest);
  }






 //


  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()=> showDialog(context: context,
      builder: (context)=>AlertDialog(
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
                onPressed: ()=>{
                  _stop(),
                  Navigator.of(context).popUntil(ModalRoute.withName('/pscMockTest')),}
              ),
              FlatButton(
                child:Text('No'),
                onPressed: () => Navigator.pop(context, false),
              ),
            ],

      )
      ),
      child: Scaffold(
        appBar:AppBar(
          elevation: 0,
          backgroundColor: baColor,
          iconTheme: IconThemeData(
            color: Colors.black54
          ),
          actions: <Widget>[

            Initialiser(stop: stop,)

           /* Center(
              child: Container(
                margin: EdgeInsets.only(right: 20),
                child: Row(
                  children: <Widget>[
                    Text(((time/3600).toInt()).toString(),style: TextStyle(
                      color: Colors.black54,
                      fontSize: 30
                    ),),
                    Text(':',style:TextStyle(color:Colors.black54) ,),
                    Text((((time%3600)/60).toInt()).toString(),style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30
                    ),),
                    Text(':',style:TextStyle(color:Colors.black54) ,),
                    Text((((time%3600)%60).toInt()).toString(),style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30
                    ),)
                  ],
                ),
              ),
            )*/
          ],
        ),
        body: /*! timerstart?
        Container(
          color: baColor,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,
                width: MediaQuery.of(context).size.width,
                ),
                FlatButton(onPressed: (){
                  _start();
                  timerstart=true;
                  },
                    child: Text('press')),
              ],
            )):*/
        Column(
            children: <Widget>[

              Expanded(
                child: ListView.builder(itemBuilder: (context,index)=>QuestionCard(question: widget.realquestions[index],addW: _addWrong,addC:_addCorrect ,skip: _addSkiplist,addall:_addall),
                itemCount: widget.realquestions.length//realquestions.length,
                ),
              ),
              Container(

                color: pColor,
                child: FlatButton(
                  onPressed: null,
                  child: GestureDetector(
                    onTap: (){
                      _stop();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(index:-1,wlist: wlist,clist: clist,skiplist:skiplist,all:widget.realquestions)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Finish and proceed',style: TextStyle(
                          color: baColor,//pCol
                          fontSize: 20// or.withOpacity(.5),
                        ),),
                        Icon(
                          Icons.arrow_forward,
                          color: baColor,
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
