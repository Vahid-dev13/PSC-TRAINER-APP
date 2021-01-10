import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psc_trainer/const.dart';
import '../models/question.dart';
class QuestionCard extends StatefulWidget {

  static List<Questions> li =generalKnowledge;
  Questions question;
  Function addC;
  Function addW;
  Function skip;
  Function addall;

  QuestionCard({this.question,this.addC,this.addW,this.skip,this.addall});
  int value =-1;
  bool v=false;




  @override


  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {


  void initState() {


    super.initState();

  }


  void _change(int va){

    if(widget.question.answer==va){
      widget.addC(widget.question);
    }else{widget.addW(widget.question);}
    if(widget.question.answer==va){
      setState(() {
        widget.value=va;
      });
    }
    else {
      setState(() {
        widget.value = va;
      });
    }
  }
  void _skiping(){
    widget.skip(widget.question);

    setState(() {
      widget.value=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.value==-1? Padding(
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
                        child: Text('Q: ${widget.question.question}',
                          style:TextStyle(
                            fontSize: 20
                          ) ,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        onTap: ()=>{_change},
                        child: Container(
                          padding: EdgeInsets.only(left: 10,bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            child: Row(children: <Widget>[

                             Radio(
                               activeColor: Colors.green,
                               value: 1,
                               onChanged: _change,
                             ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  child: Text(widget.question.option1,
                                    style:TextStyle(
                                    ) ,
                                  ),
                                ),
                              ),
                            ],),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()=>{_change},
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10,bottom: 10),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Row(children: <Widget>[

                              Radio(
                                value: 2,
                                activeColor: Colors.cyan,
                                onChanged: _change,
                              ),
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Text(widget.question.option2,
                                    style:TextStyle(
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                              ),
                            ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()=>{_change},
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10,bottom: 10),
                          child: FittedBox(
                            child: Row(children: <Widget>[

                              Radio(
                                value: 3,
                                onChanged: _change,
                              ),
                              FittedBox(
                                child: Container(
                                  child: Text(widget.question.option3,
                                    style:TextStyle(
                                    ),
                                  ),
                                ),
                              ),
                            ],),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()=>{_change},
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10,bottom: 5),
                          child: FittedBox(
                            child: Row(
                                children: <Widget>[

                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Radio(
                                    value: 4,
                                    onChanged: _change,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    child: Text(widget.question.option4,
                                      style:TextStyle(
                                      ) ,
                                    ),
                                  ),
                                ),
                              ],),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10),
                        child: FlatButton(onPressed: _skiping,
                            child:SizedBox(

                              child: Container(
                                alignment: Alignment.center,
                                  child: Text('Mark',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 23,
                                    color: Colors.red
                                  ),)
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 5,)
                    ],
                  ),
                ),
              ),


        ]
        ),
    ):SizedBox();

  }
}
