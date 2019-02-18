import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.purple,
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Container(
               width: MediaQuery.of(context).size.width / 1.86,
               height: 215,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                  
                ),
                child: Center(
                  child: Icon(Icons.first_page, color: Colors.purple, size: 180,),
                )
             ),
             Container(
               margin: const EdgeInsets.only(
                 top: 32,
                 bottom: 22
               ),
               width: MediaQuery.of(context).size.width / 1.2,
               height: 45,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(
                   Radius.circular(50)
                 ),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black26,
                     blurRadius: 10
                   )
                 ]
               ),
               child:FlatButton(
                 child: Text(
                   'ENTRAR',
                   style: TextStyle(color: Colors.purple, fontSize: 15),
                   ),
                 onPressed: () {
                   Navigator.of(context).pushNamed('Login');
                 },
               )
             ),

              Container(
               width: MediaQuery.of(context).size.width / 1.2,
               height: 45,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(
                   Radius.circular(50)
                 ),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black26,
                     blurRadius: 10
                   )
                 ]
               ),
               child:FlatButton(
                 child: Text(
                   'CRIAR CONTA',
                   style: TextStyle(color: Colors.purple, fontSize: 15),
                   ),
                 onPressed: () {
                   Navigator.of(context).pushNamed('NewUser');
                 },
               )
             ),
           ],
         ),
       ),
    );
  }
}