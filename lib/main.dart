import 'package:flutter/material.dart';
import 'package:tutor_app_final/home_page.dart';
import 'package:tutor_app_final/login_page.dart';
import 'package:tutor_app_final/register_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tutor Application',
      home: new HomePage(),
      routes: <String,WidgetBuilder>{
        '/login_page': (BuildContext context) => new LoginPage(),
        '/register_page': (BuildContext context) => new RegisterPage(),
      },
    );
  }
}