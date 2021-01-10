import 'package:flutter/material.dart';
import 'package:psc_trainer/const.dart';
class AppbarTimer extends StatefulWidget {

  int time;

  AppbarTimer({this.time});
  @override
  _AppbarTimerState createState() => _AppbarTimerState();
}

class _AppbarTimerState extends State<AppbarTimer> {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: baColor,
      iconTheme: IconThemeData(
      color: Colors.black54
     ),
     actions: <Widget>[
      Center(
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
    )
    ],
    );
  }
}
