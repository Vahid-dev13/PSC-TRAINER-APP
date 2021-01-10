import 'package:flutter/material.dart';
import '../const.dart';
import '../widgets/subwidgets/searchBox.dart';
import '../widgets/subwidgets/examList.dart';
import '../widgets/subwidgets/ExamCard.dart';
import '../models/exams.dart';

class DemoSelect extends StatefulWidget {
  int selected=1;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<DemoSelect> {

  final exams =exam;
  @override
  _changeOption(int val){
    setState(() {
      widget.selected=val;
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 23,),
            Container(
              height:MediaQuery.of(context).size.height*.079,
              width: MediaQuery.of(context).size.width*.5,
              child: FittedBox(child: Text(
                'Psc Exam Preparations',
                style: Theme.of(context).textTheme.headline3,/*TextStyle(
                  fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    fontSize: 90,
                    color: Colors.white
                ),*/
              )),
            ),
            SizedBox(
              height: 7,
            ),
            //SearchBox(selected: widget.selected,change: _changeOption),
            //ExamList(selected: widget.selected,change: _changeOption),

            SizedBox(height: 17,),
            Expanded
              (child: Stack(
              children: <Widget>[
                Container(
                  margin:EdgeInsets.only(top:0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15) )
                  ),
                ),
                ListView.builder(
                  itemBuilder:(ctx,index) => ExamCard(index: index,selected: widget.selected,),
                  itemCount: exams.length,
                )
              ],
            ))

          ],
        ),
      ),
    );
  }
}
