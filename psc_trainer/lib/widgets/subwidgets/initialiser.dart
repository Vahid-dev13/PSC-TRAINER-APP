import 'dart:async';

import 'package:flutter/material.dart';
import 'package:psc_trainer/screens/resultScreen.dart';

class Initialiser extends StatefulWidget {

  int time=4500;
  bool stop;

  Initialiser({this.stop});

  @override



  _InitialiserState createState() => _InitialiserState();
}

class _InitialiserState extends State<Initialiser> {
  @override

  void _stop(context){

    setState(() {
      widget.stop=true;
    });




    Navigator.of(context).popUntil(ModalRoute.withName('/pscMockTest'));
  }


  void _start() async{

    const onesec=Duration(seconds: 1);

    Timer.periodic(onesec, (Timer t){

      if(widget.time<1||widget.stop){
        t.cancel();
      }
      else{
        setState(() {
          widget.time--;
        });

      }

    /*  setState(() {
        if(widget.time<1){
          t.cancel();
        }
        else if(widget.stop){
          t.cancel();

        }
        else {
          widget.time=widget.time-1;
        }
      });

     */

    });
  }

  @override
   void initState(){
     _start();
     super.initState();
   }




  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Row(
          children: <Widget>[
            Text(((widget.time/3600).toInt()).toString(),style: TextStyle(
                color: Colors.black54,
                fontSize: 30
            ),),
            Text(':',style:TextStyle(color:Colors.black54) ,),
            Text((((widget.time%3600)/60).toInt()).toString(),style: TextStyle(
                color: Colors.black54,
                fontSize: 30
            ),),
            Text(':',style:TextStyle(color:Colors.black54) ,),
            Text((((widget.time%3600)%60).toInt()).toString(),style: TextStyle(
                color: Colors.black54,
                fontSize: 30
            ),)
          ],
        ),
      ),
    );
  }
}
