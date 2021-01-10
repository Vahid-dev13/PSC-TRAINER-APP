import 'package:flutter/material.dart';
import 'tabScreen.dart';
import '../const.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('PSC '
                      'Trainer',style: TextStyle(
                    fontFamily: 'daysone',
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: pColor

                  ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



