import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:psc_trainer/screens/dashboard.dart';
import 'package:psc_trainer/screens/demoSelect.dart';
import 'package:psc_trainer/widgets/body.dart';
import 'helpScreen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text('PscTrainer',style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white
        ),


          /*Theme.of(context).textTheme.headline3,*/),
          bottom: TabBar(
              tabs: <Widget>[


          Tab(
              text: 'PSC subjectwise exam'

          ),
          Tab(
            text: 'PSC Trial exam',
          )
        ]) ,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HelpScreen())),
                  child: Icon(
                      Icons.help_outline
                  )),
            )
          ],
        ),
        body: TabBarView(
          dragStartBehavior: DragStartBehavior.down,
            children: <Widget>[
          DashBoard(),
          DemoSelect()
        ]),
      ),
    );
  }
}
