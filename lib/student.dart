import 'package:flutter/material.dart';

class Student extends StatelessWidget {

  Student(this.data);

  final data;

  @override
  Widget build(BuildContext context){ 
    final Size screenSize = MediaQuery.of(context).size;
    var name = data['name']['first'];

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Hello, $name!"),
      ),
      body: Container(
        height: screenSize.height *3/7,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(data["picture"]["large"]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(data['name']['first'],style: TextStyle(fontSize:30.0, fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: new Text(data['name']['last'],style: TextStyle(fontSize:30.0, fontWeight: FontWeight.bold),),
                ),          
              ]        
            ),
          ],
        ),
      ),
    );
  }
}