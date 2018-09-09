import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutor_app_final/student.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://randomuser.me/api/?results=15"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState((){       //to re-render our list view
      var resData = json.decode(response.body);
      data = resData["results"];
    });

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  


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
              height: screenSize.height*2/9,
              //color: Colors.grey[200],
                child:Stack(
                children: <Widget>[
                  new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Welcome to Tutor App!',
                                style: new TextStyle(fontSize:25.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: screenSize.width,
                              child: new Text('Sign in to keep contact with your tutor...', 
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.grey[700],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
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
              ],
                ),
            ),

            new Container(
              color: Colors.white,
              height: screenSize.height - screenSize.height * 2/9,
              child: ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index){
                  return new ListTile(
                    title: Row(
                      children: <Widget>[
                        new Text(data[index]["name"]["first"]),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: new Text(data[index]["name"]["last"]),
                        ),
                      ]
                    ),
                    subtitle: new Text(data[index]["location"]["city"]),
                    leading: new CircleAvatar(
                      backgroundImage : new NetworkImage(data[index]["picture"]["thumbnail"])
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (BuildContext context) =>
                            new Student(data[index])
                        )
                      );
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );   
  }
}

