import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: new AppBar(title: new Text('Login')),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Form(
          child: new ListView(
            children: <Widget>[
              
              new TextFormField(
                keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                  hintText: 'you@example.com',
                  labelText: 'E-mail Address'
                ),
              ),

              new TextFormField(
                obscureText: true, // Use secure text for passwords.
                decoration: new InputDecoration(
                  hintText: 'Password',
                  labelText: 'Enter your password'
                ),
              ),

              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Login',
                    style: new TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: (){}, //this.submit,
                  color: Colors.blue,
                  elevation: 3.0,
                ),
                margin: new EdgeInsets.only(top: 20.0),
              ),

              new Text(''),

            ],
          ),
        ),
      )
    );
  }
}