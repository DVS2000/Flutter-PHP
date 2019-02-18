import 'package:aula4/homescreen.dart';
import 'package:aula4/menuhome.dart';
import 'package:aula4/newuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistem Login',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      routes: <String, WidgetBuilder>{
        'Menu': (BuildContext context) => Menu(),
        'Login': (BuildContext context) => Login(),
        'NewUser': (BuildContext context) => NewUser(),
        'Home': (BuildContext context) => HomeScreen()
      },
      home: Screen(),
    )
  );
}

class Screen extends StatefulWidget {
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // TODO: implement initState0
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}