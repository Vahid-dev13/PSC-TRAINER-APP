import 'package:flutter/material.dart';
import '../widgets/body.dart';
import '../const.dart';
import 'helpScreen.dart';


class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      /*appBar: AppBar(
        elevation: 1,
        title: Text('PscTrainer',style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white
        ),/*Theme.of(context).textTheme.headline3,*/),
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
      ),*/
      body: Body(),
    );
  }
}
