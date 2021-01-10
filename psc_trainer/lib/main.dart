import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psc_trainer/screens/DetailsScreen.dart';
import 'package:psc_trainer/screens/SplashScreen.dart';
import 'package:psc_trainer/screens/pscMockTest.dart';
import 'package:psc_trainer/screens/tabScreen.dart';
import 'const.dart';
import 'package:admob_flutter/admob_flutter.dart';

void main() {
  Admob.initialize("ca-app-pub-8112596810774973~8829134132");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: pColor,
        accentColor: pColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'Raleway',
            color: Colors.white,
            fontSize: 25
          ),
          bodyText1:TextStyle(
              fontFamily: 'Raleway',
              color: Colors.black54,
              fontSize: 40
          ),
          headline1: TextStyle(
              fontFamily: 'Raleway',
              color: Colors.black54,
              fontSize: 20
          ),
          headline6:TextStyle(
              fontFamily: 'Raleway',
              color: Colors.black54,
              fontSize: 25
          ),
        )

      ),
      home: SplashScreen(),//DashBoard(),
      routes: {
        '/detailsScreen':(ctx)=>DetailsScreen(),
        '/pscMockTest':(ctx)=>PscMockTest(),
      },
    );
  }
}
