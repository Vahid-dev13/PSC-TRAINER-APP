import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psc_trainer/const.dart';

class SearchBox extends StatefulWidget {
  int selected;
  Function change;
  SearchBox({this.selected,this.change});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  List exams = ['Syllabus wise test','Psc mock test',];
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.all(19),
      decoration: BoxDecoration(
          color: pColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        height: 46,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(

              onTap: (){
                setState(() {
                  widget.selected=0;
                  widget.change(0);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                //margin: EdgeInsets.only(left: 10,right: 10),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: 0 == widget.selected? Colors.blue.withOpacity(.4):Colors.blue.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text('Syllabus wise test',
                style:TextStyle(
                  color: 0==widget.selected?Colors.white:Colors.black.withOpacity(.5)
                ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.selected=1;
                  widget.change(1);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                //margin: EdgeInsets.only(left: 10,right: 10),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: 1 == widget.selected? Colors.blue.withOpacity(.4):Colors.blue.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text('Psc demo test',
                  style:TextStyle(
                      color: 1==widget.selected?Colors.white:Colors.black.withOpacity(.5)
                  ),
                ),
              ),
            )
          ],
        )

        /* ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,i)=>GestureDetector(
          onTap: (){
            setState(() {
              widget.selected=i;
              widget.change(i);
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            //margin: EdgeInsets.only(left: 10,right: 10),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                color: i == widget.selected? Colors.blue.withOpacity(.4):Colors.transparent,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text(exams[i],style: TextStyle(
                color: Colors.black
            ),),
          ),
        ),
        itemCount: 2,)*/,
  /*  child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,i)=>GestureDetector(
      onTap: (){
        setState(() {
          widget.selected=i;
          widget.change(i);
        });
      },
      child: Container(),
    )),*/
    /*
        height: 46,
        margin: EdgeInsets.all(11),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,i)=>GestureDetector(
            onTap: (){
              setState(() {
                widget.selected=i;
                widget.change(i);
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 19),
              padding: EdgeInsets.symmetric(horizontal: 19),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: i == widget.selected? Colors.white.withOpacity(.4):Colors.transparent,
                  borderRadius: BorderRadius.circular(11)
              ),
              child: Text(exams[i],style: TextStyle(
                  color: Colors.white
              ),),
            ),
          ),
          itemCount: exams.length,
        )*/
      )
    );
  }
}
