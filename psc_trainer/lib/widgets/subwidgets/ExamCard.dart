import 'package:flutter/material.dart';
import '../../const.dart';
import '../../models/exams.dart';
import '../../screens/DetailsScreen.dart';

class ExamCard extends StatelessWidget {
  final exams =exam;
  int index;
  int selected;
  ExamCard({this.index,this.selected});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: GestureDetector(
        onTap: (){
          selected==0?
          Navigator.of(context).pushNamed('/detailsScreen',arguments: {
            'index':index
          }):Navigator.of(context).pushNamed('/pscMockTest',arguments: {
            'index':index
          });/*(context,MaterialPageRoute(builder: (context)=>DetailsScreen(index:index)) );*/
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          height: 90,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [dShadow],
                  color: index.isOdd?Colors.blueAccent.withOpacity(.26):Colors.black26,
                ),
                height: 120,
                child: Container(
                  margin: EdgeInsets.only(right: 1,bottom: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: baColor,
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 19),
                  )
              ),
              Positioned(child:
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        child: FittedBox(
                          child: Text('${exams[index].title}',
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ))
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

