import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psc_trainer/models/question.dart';
import 'package:psc_trainer/const.dart';

class AnswerCard extends StatelessWidget {
  Questions question;
  AnswerCard({this.question});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width*.89,
              margin: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [dShadow],
                color: Colors.blueAccent.withOpacity(.26),
              ),
              child: Container(
                margin: EdgeInsets.only(right: 1,bottom: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: baColor,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Q: ${question.question}',
                        style:TextStyle(
                            fontSize: 20
                        ) ,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

              Container(
                padding: EdgeInsets.only(left: 10,bottom: 10),
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: Row(children: <Widget>[
/*
                    Radio(
                      value: 1,
                    ),*/
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                        child: Text('1.'+question.option1,
                          style:TextStyle(
                          ) ,
                        ),
                      ),
                    ),
                  ],),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10,bottom: 10),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(children: <Widget>[

                    /*Radio(
                      value: 2,
                      activeColor: Colors.cyan,

                    ),*/
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text('2.'+question.option2,
                        style:TextStyle(
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10,bottom: 10),
                child: FittedBox(
                  child: Row(children: <Widget>[

                    /*Radio(
                      value: 3,
                    ),*/
                    FittedBox(
                      child: Container(
                        child: Text('3.'+question.option3,
                          style:TextStyle(
                          ),
                        ),
                      ),
                    ),
                  ],),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10,bottom: 5),
                child: FittedBox(
                  child: Row(
                    children: <Widget>[

                      /*Container(
                        alignment: Alignment.centerLeft,
                        child: Radio(
                          value: 4,
                        ),
                      ),*/
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                          child: Text('4.'+question.option4,
                            style:TextStyle(
                            ) ,
                          ),
                        ),
                      ),



                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(5),
                      child: FittedBox(
                        child: Row(
                          children: <Widget>[

                            Container(
                              padding: EdgeInsets.only(left: 10,bottom: 10),
                              child: Text('Answer',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 23,
                                  color: Colors.green
                              ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                  padding: EdgeInsets.only(left: 10,bottom: 10),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                      child: Text('${question.answer==1?question.option1:
                                      question.answer==2?question.option2:
                                      question.answer==3?question.option3:
                                      question.answer==4?question.option4:
                                      null}'),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


          ]
      ),

              ))]));
  }
}
