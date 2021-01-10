

import 'package:flutter/material.dart';
import 'package:psc_trainer/widgets/subwidgets/subjectSelect.dart';
import 'examscreen.dart';
import 'readscreen.dart';
import '../models/exams.dart';
import 'package:psc_trainer/models/question.dart';
import '../const.dart';
import 'package:psc_trainer/services.dart';
import 'package:admob_flutter/admob_flutter.dart';




const String mobile_id='Mobile_id';

class DetailsScreen extends StatefulWidget {

  int loaded = 1;
  int eligible = 0;
  /*int index;

  DetailsScreen({this.index});*/


  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  AdmobInterstitial interstitial;
  AdmobReward rewarded;
  final exams = exam;

  int e=0;

  int selected=0;

  final subject =examtopic;

  List<Questions> gk=generalKnowledge;

  List<Questions> math=mathematics;

  List<Questions> English=english;

  List<Questions> Renaisance=renaissance;

  List<Questions> Language=language;

  List<Questions> Science=science;

  List<Questions> subjectQuestions=generalKnowledge;

  final ams =admobServices();

  @override
  void initState() {

    Admob.initialize(ams.getAdmobAppId(),);
    interstitial = AdmobInterstitial(adUnitId: Admanager().interstitial, listener: (events,args){
      if(events == AdmobAdEvent.rewarded){
        setState(() {
          widget.eligible=1;
        });
      }
    });
    rewarded = AdmobReward(adUnitId: Admanager().rewarded);
    interstitial.load();
    rewarded.load();

    super.initState();

    setState(() {
      widget.loaded=1;
    });


  }


  @override

  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map <String,int>;
    final index =arguments['index'];







    _topicSelect(int val){
      int test=1;
      if(subject[index][val]=='General Knowledge'){
        test =1;
      }else if(subject[index][val]=='Simple Arithmetic'){test=2;}
      else if(subject[index][val]=='English'){test=3;}
      else if(subject[index][val]=='Science'){test=4;}
      else if(subject[index][val]=='Language'){test=5;}
      else if(subject[index][val]=='Renaissance'){test=6;}
      switch(test){
        case 1:
          subjectQuestions=gk;
          break;
        case 2:
          subjectQuestions=math;
          break;
        case 3:
          subjectQuestions=English;
          break;
        case 4:
          subjectQuestions=Science;
          break;
        case 5:
          subjectQuestions=Language;
          break;
        case 6:
          subjectQuestions=Renaisance;
          break;

      }

     /* setState(() {
        e=val;
        selected=val;
      });*/


    }






    return Scaffold(
      backgroundColor: baColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baColor,
        leading: IconButton(
            padding:EdgeInsets.only(left: 20),
            icon: Icon(Icons.arrow_back,
            color: Colors.black,
            ),
            onPressed: (){
              Navigator.pop(context);
            }),
      ),
      body: widget.loaded==0?Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child: Container(
          color: baColor,
          child: Column(
            children: <Widget>[
              FittedBox(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                 // height: MediaQuery.of(context).size.height*.7,
                  decoration: BoxDecoration(
                      color: baColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text('${exams[index].title}',style: Theme.of(context).textTheme.bodyText1,),
                        SizedBox(height: 5,),
                        SizedBox(height: 1,

                        child: Container(
                          color: pColor,
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Text('Syllabus',style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ),


                        SubjectSelect(index: index,change: _topicSelect,),

                        /*Container(
                          margin: EdgeInsets.all(11),
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,i)=>GestureDetector(
                              onTap:()=>_topicSelect(i)

                              /* (){
                                setState(() {
                                  e=i;
                                  selected=i;
                                });
                              },*/,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: i == selected? pColor.withOpacity(.4):Colors.transparent,
                                    borderRadius: BorderRadius.circular(11)
                                ),
                                child: Text(subject[widget.index][i].toString(),style: TextStyle(
                                    color: Colors.black54
                                ),),
                              ),
                            ),
                            itemCount: subject[widget.index].length,
                          ),
                        ),*/
                        GestureDetector(
                          onTap: () async {
                            if(await interstitial.isLoaded){
                              interstitial.show();
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadScreen(topic:subject[index][e].toString(),realQ:subjectQuestions ,)));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                            color: baColor,
                            height: 120,
                            padding: EdgeInsets.all(10),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: pColor.withOpacity(.4),
                                      boxShadow: [dShadow]
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1,bottom: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: baColor,
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
                                            child: Text('Start Reading',
                                              softWrap: true,
                                              style: Theme.of(context).textTheme.headline6,
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





                        GestureDetector(
                          onTap:  () async {
                            if (await rewarded.isLoaded){
                              rewarded.show();
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamScreen(index:index,topic:subject[index][e].toString(),realquestions: subjectQuestions,)));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                            color: baColor,
                            height: 120,
                            padding: EdgeInsets.all(10),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    color: pColor.withOpacity(.4),
                                      boxShadow: [dShadow]
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1,bottom: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: baColor,
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
                                            child: Text('Start Test',
                                              softWrap: true,
                                              style: Theme.of(context).textTheme.headline6,
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

                        SizedBox(
                          height: MediaQuery.of(context).size.height*.15,
                        ),
                        Container(
                            alignment: Alignment.bottomCenter,
                            child: FittedBox(child: AdmobBanner(adUnitId: ams.getAdmobaddId(), adSize: AdmobBannerSize.LARGE_BANNER,))),

                        Container(
                          height: 85,
                        )


                      ],
                    ),

                  ),

                ),
              ),

            ],
             //

          ),
        ),
      ),
    );
  }
}
