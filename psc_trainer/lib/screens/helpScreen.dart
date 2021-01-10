import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:psc_trainer/const.dart';

class HelpScreen extends StatefulWidget {

  int show = 0;
  int dropdown=1;
  int dropdowncontact = 1;
  int showcontact = 0;
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

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




  void _changecontact(){

    if(widget.showcontact==0){

      setState(() {
        widget.showcontact=1;
      });
    }

    else if (widget.showcontact==1){
      widget.showcontact=0;
    }

  }

  void _changearrowcontact(){

    if(widget.dropdowncontact==1){
      setState(() {
        widget.dropdowncontact=0;
      });
    }
    else if(widget.dropdowncontact==0){
      setState(() {
        widget.dropdowncontact=1;
      });
    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baColor,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[

              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text('How to use',
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

                            SizedBox(
                              height: 1,
                              child: Container(
                                color: pColor,
                              ),
                            ),

                            Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 20,),




                                  FittedBox(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 25,right: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context).size.width*.9,
                                            child: FittedBox(
                                              child: Row(
                                                children: <Widget>[
                                                  Text('Step 1 :',style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: pColor
                                                  ),),
                                                  FittedBox(
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 5),
                                                      child: Text('Select the exam mode you want to try. ',
                                                        style: TextStyle(
                                                            fontFamily: 'Raleway',
                                                            fontSize: 16
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 14,),

                                          Container(
                                            width: MediaQuery.of(context).size.width*.9,
                                            child: FittedBox(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin:EdgeInsets.only(left: 0),
                                                    child: Text('Step 2 :',style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: pColor
                                                    ),),
                                                  ),
                                                  FittedBox(
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 5),
                                                      child: Text('Select the post your are preparing for.',
                                                        style: TextStyle(
                                                            fontFamily: 'Raleway',
                                                            fontSize: 16
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 14,
                                          ),

                                          Container(
                                            width: MediaQuery.of(context).size.width*.9,
                                            child: FittedBox(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin:EdgeInsets.only(left: 0),
                                                    child: Text('Step 3 :',style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: pColor
                                                    ),),
                                                  ),
                                                  FittedBox(
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 5),
                                                      child: Text('Select "start test" option to start a test.',
                                                        style: TextStyle(
                                                            fontFamily: 'Raleway',
                                                            fontSize: 16
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            height: 14,
                                          ),

                                          Container(
                                            width: MediaQuery.of(context).size.width*.9,
                                            child: FittedBox(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin:EdgeInsets.only(left: 0),
                                                    child: Text('Step 4 :',style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: pColor
                                                    ),),
                                                  ),
                                                  FittedBox(
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 5),
                                                      child: Text('Select answers for the given questions.',
                                                        style: TextStyle(
                                                            fontFamily: 'Raleway',
                                                            fontSize: 16
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            height: 14,
                                          ),

                                          Container(
                                            width: MediaQuery.of(context).size.width*.9,
                                            child: FittedBox(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin:EdgeInsets.only(left: 0),
                                                    child: Text('Step 5 :',style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: pColor
                                                    ),),
                                                  ),
                                                  FittedBox(
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 5),
                                                      child: Text('Select "finish and proceed when finished".',
                                                        style: TextStyle(
                                                            fontFamily: 'Raleway',
                                                            fontSize: 16
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),


                                          SizedBox(
                                            height: 14,
                                          ),

                                          Container(
                                            width: MediaQuery.of(context).size.width*.9,
                                            child: FittedBox(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin:EdgeInsets.only(left: 0),
                                                    child: Text('Step 6 :',style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: pColor
                                                    ),),
                                                  ),
                                                  FittedBox(
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 5),
                                                      child: Text('Inspect your result and improve your score.',
                                                        style: TextStyle(
                                                            fontFamily: 'Raleway',
                                                            fontSize: 16
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
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
              )









              ,

              SizedBox(
                height: 20,
              ),


              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text('Contact',
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




                      GestureDetector(
                          onTap: (){
                            _changecontact();
                            _changearrowcontact();
                          },
                          child: widget.dropdowncontact==1? Container(child: Icon(Icons.keyboard_arrow_down,size: 35,)):SizedBox()),

                      Container(
                        width: MediaQuery.of(context).size.width*.8,
                        child: widget.showcontact==0?SizedBox():
                        Column(
                          children: <Widget>[

                            SizedBox(
                              height: 1,
                              child: Container(
                                color: pColor,
                              ),
                            ),

                            Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 20,),




                                  FittedBox(
                                    child:  Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text('Vahid',
                                      style: TextStyle(
                                        color: pColor,
                                        fontSize: 30
                                      ),
                                      ),
                                    )
                                  ),
                                  
                                  FittedBox(
                                    child: Container(
                                      child: Text('devvahid13@gmail.com',
                                      style: TextStyle(
                                        fontSize: 20
                                      ),
                                      ),
                                    ),
                                  )





                                ],
                              ),
                            ),










                            GestureDetector(
                                onTap: (){
                                  _changecontact();
                                  _changearrowcontact();
                                },
                                child: widget.dropdowncontact==0? Container(child: Icon(Icons.keyboard_arrow_up,size: 35,)):SizedBox()),
                          ],
                        )
                        ,
                      )
                    ],
                  ),
                ),
              )








            ],
          ),
        ),
      ),
    );
  }
}
