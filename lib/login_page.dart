import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tutor_app_final/loged_in_tutor.dart';
import 'package:validate/validate.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginData {
  String email = '';
  String password = '';
  String role = '';
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  
  _LoginData _data = new _LoginData();

  //<<<<<<<<<<<Email Validation>>>>>>>>>

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }
    return null;
  }

  //<<<<<<<<<password Validation>>>>>>>>>>

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }
    return null;
  }

//<<<<<<<<<Submit and Login>>>>>>>>>>>>>>>

    void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save the form now.

      Map<String, dynamic> mapData = <String, dynamic> {
        "username":'${_data.email}',
        "password":'${_data.password}',
        "role": '${_data.role}',
      };
      _login(mapData);
    }
  }

  String msg ="";

  //<<<<<<<<<<<<<<<<<<<<Sending http request>>>>>>>>>>>>>>

  Future<List> _login(jsonObj) async {
    try{
    final response = await http.post('http://192.168.8.104:3000/login', body:jsonObj);

    Map<String, dynamic> value = json.decode(response.body);
    String state = value['msg'];

    if(state == 'true'){
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => LogedInTutor(),
        )
      );
    } else {
      msg = "Login Failed!";
    }
    } catch(e) {
      print(e.toString());
      msg = "Login Failed!";
    }

  }

  //<<<<<<<<<<<<<Radio Button>>>>>>>>>>>>>>
  int groupValue;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: new AppBar(title: new Text('Login')),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              
              new TextFormField(
                keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                  hintText: 'you@example.com', hintStyle: new TextStyle(fontSize:14.0),
                  labelText: 'E-mail Address'
                ),
                validator: this._validateEmail,
                onSaved: (String value){this._data.email=value;},
              ),

              new TextFormField(
                obscureText: true, // Use secure text for passwords.
                decoration: new InputDecoration(
                  hintText: 'Password', hintStyle: new TextStyle(fontSize:14.0),
                  labelText: 'Enter your password'
                ),
                validator: this._validatePassword,
                onSaved: (String value) {
                  this._data.password = value;
                }
              ),

              new Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  new Text('Student',style: TextStyle(fontSize:16.0),),
                  new Radio(
                    onChanged: (int R) => something(R),
                    activeColor: Colors.blue,
                    value: 0,
                    groupValue: groupValue,
                  ),
                  new Padding(padding: EdgeInsets.only(left:30.0),),
                  new Text('Tutor', style: TextStyle(fontSize:16.0),),
                  new Radio(
                    onChanged: (int R) => something(R),
                    activeColor: Colors.blue,
                    value: 1,
                    groupValue: groupValue,
                  ),

                ],
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
                  onPressed: this.submit, //this.submit,
                  color: Colors.blue,
                  elevation: 3.0,
                ),
                margin: new EdgeInsets.only(top: 20.0),
              ),

              new Container(
                padding: EdgeInsets.only(top:20.0),
                child: new Text(msg)
              ),

            ],
          ),
        ),
      )
    );
  }

  something(int R) {
    setState(()
      {
        if(R == 0){
          groupValue = 0;
        } else if(R == 1) {
          groupValue = 1;
        }
      }
    );
  }
}