import 'package:flutter/material.dart';
import 'package:psc_trainer/models/question.dart';
import '../../const.dart';
import '../../screens/wrongScreen.dart';

class AnalyticsCard extends StatefulWidget {
  List<Questions> clist;
  List<Questions> wlist;
  List<Questions> marklist;
  List<Questions> all;
  int index;
  int show = 0;
  int dropdown=1;
  AnalyticsCard({this.clist,this.wlist,this.marklist,this.index,this.all});
  @override
  _AnalyticsCardState createState() => _AnalyticsCardState();
}

class _AnalyticsCardState extends State<AnalyticsCard> {

  void _change(){

    if(widget.show==0){

      setState(() {
        widget.show=1;
      });
    }

    else if (widget.show==1){
      widget.show=0;
    }

  }

  void _changearrow(){

    if(widget.dropdown==1){
      setState(() {
        widget.dropdown=0;
      });
    }
    else if(widget.dropdown==0){
      setState(() {
        widget.dropdown=1;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              child: Text('Analytics',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 30,
                    color: Colors.black54
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width:MediaQuery.of(context).size.width*.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10,),bottomLeft: Radius.circular(10)),
                      color: Colors.green,

                    ),
                    width: widget.index==-1? MediaQuery.of(context).size.width*.8*(widget.clist.length/120):MediaQuery.of(context).size.width*.8*(widget.clist.length/25),

                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:widget.clist.length==0? BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)):BorderRadius.circular(0),
                      color: Colors.redAccent.withOpacity(.9),
                    ),
                    width:widget.index==-1? MediaQuery.of(context).size.width*.8*(widget.wlist.length/120):MediaQuery.of(context).size.width*.8*(widget.wlist.length/25),

                  ),
                  Container(
                    width: widget.index==-1? MediaQuery.of(context).size.width*.8*((120-widget.clist.length-widget.wlist.length)/120):MediaQuery.of(context).size.width*.8*((25-widget.clist.length-widget.wlist.length)/25),

                    decoration: BoxDecoration(
                      borderRadius: widget.clist.length!=0||widget.wlist.length!=0? BorderRadius.only(bottomLeft: Radius.circular(0),topLeft: Radius.circular(0),topRight: Radius.circular(10),bottomRight: Radius.circular(10)):BorderRadius.circular(10),
                      color: pColor,
                    ),

                  ),

                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            GestureDetector(
                onTap: (){
                  _change();
                  _changearrow();
                },
                child: widget.dropdown==1? Container(child: Icon(Icons.keyboard_arrow_down,size: 35,)):SizedBox()),

            Container(
              width: MediaQuery.of(context).size.width*.8,
              child: widget.show==0?SizedBox():
              Column(
                children: <Widget>[
                  Card(
                    child:GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WrongScreen(wlist: widget.wlist,)));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*.1,
                          child: Center(
                              child: Text('Wrong Answers',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black54.withOpacity(.3),
                                  fontSize: 30,
                                ),
                              )),
                        )
                    ),
                  ),
                  Card(
                    child:GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WrongScreen(wlist: widget.marklist,)));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*.1,
                          child: Center(
                              child: Text('Marked Answers',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black54.withOpacity(.3),
                                  fontSize: 30,
                                ),
                              )),
                        )
                    ),
                  ),
                  Card(
                    child:GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WrongScreen(wlist: widget.all,)));
                        },
                        child:widget.index==-1? Container(
                          height: MediaQuery.of(context).size.height*.1,
                          child: Center(
                              child: Text('All Answers',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black54.withOpacity(.3),
                                  fontSize: 30,
                                ),
                              )),
                        ):SizedBox()
                    ),


                    /*Container(
                      height: 20,
                      width:MediaQuery.of(context).size.width*.8,
                    ),*/
                  ),

                  SizedBox(height: 20,),

                  GestureDetector(
                      onTap: (){
                        _change();
                        _changearrow();
                      },
                      child: widget.dropdown==0? Container(child: Icon(Icons.keyboard_arrow_up,size: 35,)):SizedBox()),
                ],
              )
              ,
            )
          ],
        ),
      ),
    );
  }
}
