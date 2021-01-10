import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psc_trainer/const.dart';
import 'package:psc_trainer/screens/wrongScreen.dart';
import 'package:psc_trainer/widgets/subwidgets/analyticsCard.dart';
import '../models/question.dart';

class ResultScreen extends StatefulWidget {
  int index;
  List<Questions> skiplist;
  List<Questions> wlist;
  List<Questions> clist;
  List<Questions> all;
  ResultScreen({this.index,this.wlist,this.clist,this.skiplist,this.all});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()  => showDialog(
          context: context,
        builder:(context)=> ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: AlertDialog(
            title: Text('Warning',textAlign: TextAlign.center,style: TextStyle(color: Colors.red),),
            content: Text('GO Back To Home?',textAlign: TextAlign.center,style: TextStyle(color: Colors.black54,),),
            actions: <Widget>[
              FlatButton(
                child:Text('Yes'),
                onPressed: ()=>widget.index<0?Navigator.of(context).popUntil(ModalRoute.withName('/pscMockTest')):
                Navigator.of(context).popUntil(ModalRoute.withName('/detailsScreen')),
              ),
              FlatButton(
                child:Text('No'),
                onPressed: () => Navigator.pop(context, false)
                  
              ),
            ],
          ),
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
                    content:
                          Text('GO Back To Home?',textAlign: TextAlign.center,style: TextStyle(color:  Colors.black54),),
                    actions: <Widget>[
                      FlatButton(
                        child:Text('Yes'),
                        onPressed: ()=>widget.index<0?Navigator.of(context).popUntil(ModalRoute.withName('/pscMockTest')):
                        Navigator.of(context).popUntil(ModalRoute.withName('/detailsScreen')),
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
          body:SingleChildScrollView(
            child: Container(

              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      child: Container(
                        color: baColor,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height:MediaQuery.of(context).size.height*.01,
                            ),

                            Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('Result',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                      )

                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 1,
                                    color: pColor,
                                    margin: EdgeInsets.only(left: 20,right: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                ],
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: pColor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              alignment: Alignment.center,
                              
                              width: MediaQuery.of(context).size.width*.8+20,

                              child: Column(
                                children: <Widget>[

                                  SizedBox(height: 40,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: FittedBox(
                                          child: Text(
                                            'Your score :',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 30,
                                                color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(child: FittedBox(
                                        child: Text(
                                          widget.clist.length.toString(),
                                          style: TextStyle(
                                              fontFamily: 'Raleway',
                                              fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),)
                                    ],
                                  ),
                                  SizedBox(height: 40,),

                                  SizedBox(height: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    color: Colors.white,
                                  ),

                                  ),

                                  SizedBox(
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: FittedBox(
                                              child: Text('Correct :  ${widget.clist.length}',
                                              style: TextStyle(
                                                color: Colors.white
                                              ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: FittedBox(
                                              child: Text('Wrong :  ${widget.wlist.length}',
                                                style: TextStyle(
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),

                                          ),
                                          Container(
                                            child: FittedBox(
                                              child: Text('Marked :  ${widget.skiplist.length}',
                                                style: TextStyle(
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),

                            ),

                            SizedBox(
                              height: 15,
                            ),

                            AnalyticsCard(clist:widget.clist, wlist:widget.wlist, marklist:widget.skiplist, index:widget.index,all:widget.all),

                            /*Card(
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*.7,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Wrong Answers'
                                  ),
                                ),
                              ),
                            ),
                            Card(

                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*.7,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                      'Wrong Answers'
                                  ),
                                ),
                              ),

                            ),
                            Card(
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*.7,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                      'Wrong Answers'
                                  ),
                                ),
                              ),

                            ),*/

                            /*ClipRRect(
                              child: Container(
                                alignment: Alignment.center,
                               // height: MediaQuery.of(context).size.height*.7,
                                child: Card(
                                  elevation: 10,
                                  margin: EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(5),
                                      color: pColor,
                                    ),

                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                            color: pColor,
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          alignment: Alignment.center,
                                          child: FittedBox(
                                            child: Text('Your score',style: TextStyle(
                                              fontFamily: 'Raleway',
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold,
                                              color: baColor

                                            ),),
                                          ),
                                        ),
                                        SizedBox(height: 8,),
                                        Container(
                                          child: FittedBox(
                                            child: Text(widget.clist.length.toString(),
                                              style: TextStyle(
                                                color: baColor,
                                                fontFamily: 'Raleway',
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        SizedBox(
                                          height: 1,
                                          child: Container(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),


                                        GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>WrongScreen(wlist: widget.wlist,)));
                                            },
                                            child: Card(
                                              elevation: 50,
                                              margin: EdgeInsets.only(left: 20,right: 20),
                                              color: pColor.withOpacity(.95),
                                              child: Container(
                                                height: MediaQuery.of(context).size.height*.1,
                                                width: MediaQuery.of(context).size.width*.79,
                                                child: Center(
                                                    child: Text('Wrong Answers',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 30,
                                                      ),
                                                    )),
                                              ),
                                            )
                                        ),
                                        SizedBox(
                                          height: 17,
                                        ),


                                        GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>WrongScreen(wlist: widget.all,)));
                                            },
                                            child: Card(
                                              elevation: 50,
                                              margin: EdgeInsets.only(left: 20,right: 20),
                                              color: pColor.withOpacity(.95),
                                              child: Container(
                                                height: MediaQuery.of(context).size.height*.1,
                                                width: MediaQuery.of(context).size.width*.79,
                                                child: Center(
                                                    child: Text('All Questions',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 30,
                                                      ),
                                                    )),
                                              ),
                                            )
                                        ),


                                        SizedBox(
                                          height: 17,
                                        ),

                                        GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>WrongScreen(wlist: widget.skiplist,)));
                                            },
                                            child: Card(
                                              elevation: 50,
                                              margin: EdgeInsets.only(left: 20,right: 20),
                                              color: pColor.withOpacity(.95),
                                              child: Container(
                                                height: MediaQuery.of(context).size.height*.1,
                                                width: MediaQuery.of(context).size.width*.79,
                                                child: Center(
                                                    child: Text('Marked Questions',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                      ),
                                                    )),
                                              ),
                                            )
                                        ),
                                        SizedBox(
                                          height: 17,
                                        ),
                                        GestureDetector(
                                            onTap: ()=>widget.index<0?Navigator.of(context).popUntil(ModalRoute.withName('/pscMockTest')):
                                            Navigator.of(context).popUntil(ModalRoute.withName('/detailsScreen')),

                                            child: Card(
                                              elevation: 10,
                                              margin: EdgeInsets.only(left: 20,right: 20),
                                              color: pColor.withOpacity(.95),
                                              child: Container(
                                                height: MediaQuery.of(context).size.height*.1,
                                                width: MediaQuery.of(context).size.width*.79,
                                                child: Center(
                                                    child: Text('New test',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 30,
                                                      ),
                                                    )),
                                              ),
                                            )
                                        ),
                                        SizedBox(
                                          height: 30,
                                        )


                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),*/


                            /*SizedBox(
                              height: 5,
                            ),*/



                           /*
                           Column(
                             children: <Widget>[
                               GestureDetector(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>WrongScreen(wlist: widget.wlist,)));
                                 },
                                 child: Card(
                                   elevation: 20,
                                   margin: EdgeInsets.only(left: 20,right: 20),
                                   color: Color(0xFF637B95),
                                   child: Container(
                                     height: 100,
                                     width: MediaQuery.of(context).size.width*.79,
                                     child: Center(
                                         child: Text('Wrong answers',
                                         style: TextStyle(
                                           fontFamily: 'Roboto',
                                           color: Colors.white,
                                           fontSize: 20,
                                         ),
                                         )),
                                   ),
                                 )
                               ),
                               SizedBox(
                                 height: 17,
                               ),

                               GestureDetector(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>WrongScreen(wlist: widget.wlist,)));
                                 },
                                 child: Card(
                                   margin: EdgeInsets.only(left: 20,right: 20),
                                   color: Color(0xFF637B95),
                                   child: Container(
                                     height: 100,
                                     width: MediaQuery.of(context).size.width*.79,
                                     child: Center(
                                         child: Text('Skipped Questions',
                                           style: TextStyle(
                                             fontFamily: 'Roboto',
                                             color: Colors.white,
                                             fontSize: 20,
                                           ),
                                         )),
                                   ),
                                 )
                               ),
                               SizedBox(
                                 height: 17,
                               ),
                               GestureDetector(
                                   onTap: ()=>widget.index<0?Navigator.of(context).popUntil(ModalRoute.withName('/pscMockTest')):
                                   Navigator.of(context).popUntil(ModalRoute.withName('/detailsScreen')),

                                   child: Card(
                                     margin: EdgeInsets.only(left: 20,right: 20),
                                     color: Color(0xFF637B95),
                                     child: Container(
                                       height: 100,
                                       width: MediaQuery.of(context).size.width*.79,
                                       child: Center(
                                           child: Text('New test',
                                             style: TextStyle(
                                               fontFamily: 'Roboto',
                                               color: Colors.white,
                                               fontSize: 20,
                                             ),
                                           )),
                                     ),
                                   )
                               ),

                               SizedBox(
                                 height: 5,
                               ),


                             ],
                           )*/

                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                                onTap: ()=>widget.index<0?Navigator.of(context).popUntil(ModalRoute.withName('/pscMockTest')):
                                Navigator.of(context).popUntil(ModalRoute.withName('/detailsScreen')),

                                child: Card(



                                  child: Container(
                                    height: MediaQuery.of(context).size.height*.1,
                                    width: MediaQuery.of(context).size.width*.8+20,
                                    child: Center(
                                        child: Text('New test',
                                          style: TextStyle(
                                              fontFamily: 'Raleway',
                                              fontSize: 30,
                                              color: Colors.black54
                                          ),
                                        )),
                                  ),
                                )
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
