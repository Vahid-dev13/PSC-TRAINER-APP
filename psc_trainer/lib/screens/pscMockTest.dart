
import 'package:flutter/material.dart';
import 'package:psc_trainer/screens/PscExamScreen.dart';
import 'package:psc_trainer/screens/pscReadScreen.dart';
import '../const.dart';
import '../models/exams.dart';
import '../models/question.dart';

import 'package:psc_trainer/services.dart';
import 'package:admob_flutter/admob_flutter.dart';
const String mobile_id='Mobile_id';


class PscMockTest extends StatefulWidget {
  @override
  _PscMockTestState createState() => _PscMockTestState();
}

class _PscMockTestState extends State<PscMockTest> {
  final exams = exam;

  List<Questions> gk=generalKnowledge;

  List<Questions> math=mathematics;

  List<Questions> English=english;

  List<Questions> Renaisance=renaissance;

  List<Questions> Language=language;

  List<Questions> Science=science;

  final subject =examtopic;

  List<Questions> totalq=[];


  final ams =admobServices();

  AdmobInterstitial interstitial;
  AdmobReward reward;

  @override
  void initState() {



    super.initState();
    Admob.initialize(ams.getAdmobAppId(),);

    interstitial = AdmobInterstitial(adUnitId: Admanager().interstitial);
    reward = AdmobReward(adUnitId: Admanager().rewarded);

    interstitial.load();




    reward =AdmobReward(adUnitId: Admanager().rewarded,listener: (access,args){
      if(access == AdmobAdEvent.rewarded){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>PscExamScreen(realquestions: totalq,)));
      }
    },);

    reward.load();

  }



  @override


  Widget build(BuildContext context) {
    final arguments=ModalRoute.of(context).settings.arguments as Map<String ,int>;
    final index =arguments['index'];

    _questionSelect(){
      if (subject[index].contains('General Knowledge')){
        int check =0;
        while(check<40){
          totalq.add((gk..shuffle()).first);
          check++;
        }
      };

      if (subject[index].contains('Simple Arithmetic')){
        int check =0;
        while(check<20){
          totalq.add((math..shuffle()).first);
          check++;
        }
      };

      if (subject[index].contains('English')){
        int check =0;
        while(check<20){
          totalq.add((English..shuffle()).first);
          check++;
        }
      };

      if (subject[index].contains('Renaissance')){
        int check =0;
        while(check<10){
          totalq.add((Renaisance..shuffle()).first);
          check++;
        }
      };

      if (subject[index].contains('Science')){
        int check =0;
        while(check<10){
          totalq.add((Science..shuffle()).first);
          check++;
        }
      };


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
      body: Container(
        color:baColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height*.65,
                decoration: BoxDecoration(
                    color: baColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text('${exams[index].title}',style: Theme.of(context).textTheme.bodyText1,),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: 1,
                      child: Container(
                        color: pColor,
                      ),
                      ),

                      SizedBox(
                        height: 10,
                      ),




                      GestureDetector(
                        onTap: () async{

                          if (await interstitial.isLoaded){
                            interstitial.show();

                          }
                          _questionSelect();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PscReadScreen(realquestions:totalq)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
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
                        onTap: () async {

                          if(await reward.isLoaded){
                            await Duration(seconds: 3);
                            reward.show();

                          }
                          _questionSelect();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PscExamScreen(realquestions: totalq,)));

                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
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






                      SizedBox(height: 10,),
                      Container(
                        child: FittedBox(child: Text('Note:Language questions are not included',style: TextStyle(
                            color: Colors.black54
                        ),)),

                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height*.15,
                      ),
                      FittedBox(child: AdmobBanner(adUnitId: ams.getAdmobaddId(), adSize: AdmobBannerSize.LARGE_BANNER,)),
                      SizedBox(height: MediaQuery.of(context).size.height*.17,),


                    ],
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


