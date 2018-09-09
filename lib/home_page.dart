import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title:new Text('Tutor App'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () {},padding:EdgeInsets.only(right:20.0)),
        ],
        ),
      drawer: new Drawer(),
      body: Container(
        height: screenSize.height,
        padding: EdgeInsets.all(2.0),
        child: new ListView(
          children: <Widget>[            
            new Container(
              height: screenSize.height*2/7,
              color: Colors.grey[200],
              child:new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: screenSize.width / 2,
                    child: new Text('Sign in to keep contact with your tutor...', 
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      new RaisedButton(
                        color: Colors.white,
                        onPressed:(){},
                        child: new Text('LOGIN', style: TextStyle(color:Colors.blue),)
                      ),
                      
                      new RaisedButton(
                        color: Colors.white,
                        onPressed:(){},
                        child: new Text('REGISTER',style: TextStyle(color:Colors.blue),)
                      ),

                    ]
                  )
                ],
              ), 

            ),

            new Container(
              color: Colors.deepPurple[100],
              height: screenSize.height - screenSize.height * 2/7,
            ),

          ],
        ),
      ),
    );   
  }
}

