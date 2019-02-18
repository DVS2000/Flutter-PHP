import 'dart:convert';

import 'package:aula4/menuhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // ==================================
  // ===========CAMPOS==================
  // ==================================
  TextEditingController _telefone = new TextEditingController();
  TextEditingController _senha = new TextEditingController();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // TODO: implement initState
    super.initState();
  }

  bool _save = false;
  void _saveSenha(bool value){
    print('Salvou senha');
    setState(() {
     _save = value; 
    });
  }


  // ==================================
  // ===========LOGIN==================
  // ==================================

  var data;
  Future<List> login() async {
    final response = await http.get(
      Uri.encodeFull(
        "http://192.168.1.248/login/login.php?telefone=${_telefone.text.trim()}&senha=${_senha.text.trim()}",
        
      ),
      headers: {"Accept": "Aplication/Json"}
    );

    setState(() {
     data = json.decode(response.body);

      if (data.toString() == '[]') {
        _showWarning();
      }
       else {
       
          // ======================================
          // ====== CHAMANDO A TELA PRINCIPAL =====
          // ======================================
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => Menu(list: data, index: 0,)
            ), 
               (Route<dynamic> route) => false
            );
      } 
    });
   // print(response.body);
    return json.decode(response.body);
  }


  GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();
    
    void _showWarning() {
      _scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.warning),
              Text('Os seus dados estão errados !')
            ],
          ),
        )
      );
    }
    

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple,),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('Home', (Route<dynamic> route) => false);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
           color: Colors.white,
           height: MediaQuery.of(context).size.height / 1.1,
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 
                 Container(
                   width: MediaQuery.of(context).size.width / 1.83,
                   height: 215,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Icon(Icons.first_page, color: Colors.white, size: 180,),
                    )
                 ),
                 Container(
                   margin: const EdgeInsets.only(
                     top: 32,
                     bottom: 22
                   ),
                   padding: const EdgeInsets.only(
                     top: 0,
                     bottom: 0,
                     left: 16,
                     right: 16
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
                         blurRadius: 8
                       )
                     ]
                   ),
                   child:TextField(
                     controller: _telefone,
                     keyboardType: TextInputType.number,
                     maxLength: 14,
                     decoration: InputDecoration(
                       hintText: 'Telefone',
                       icon: Icon(Icons.phone),
                       border: InputBorder.none
                     ),
                   ),
                 ),

                  Container(
                    padding:  const EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                      left: 16,
                      right: 16
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
                   child:TextField(
                     controller: _senha,
                      obscureText: true,
                     decoration: InputDecoration(
                       hintText: 'Senha',
                       icon: Icon(Icons.lock),
                       border: InputBorder.none
                     ),
                   ),
                 ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      right: 0,
                      left: 30
                    ),
                    child:Row(
                      children: <Widget>[
                        Checkbox(
                          onChanged: (value) { 
                            _saveSenha(value);
                            },
                            value: _save,
                         
                        ),
                        Text('Guardar a senha ?')
                      ],
                    ),
                  ),
                ),


                   Container(
                     margin: const EdgeInsets.only(
                       top: 22,
                       bottom: 0
                     ),
                    padding:  const EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                      left: 16,
                      right: 16
                    ),
                   width: MediaQuery.of(context).size.width / 1.2,
                   height: 45,
                   decoration: BoxDecoration(
                     color: Colors.purple,
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
                       'Entrar',
                       style: TextStyle(
                         color: Colors.white, fontSize: 15
                       ),
                     ),
                     onPressed: (){
                       login();
                       
                     },
                   )
                 ),
                  Center(
                  
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 0
                    ),
                    child:Text('Esqueceu sua senha ?'),
                  ),
                ),
                 Spacer(),
            
                 Align(
                   alignment: Alignment.bottomLeft,
                   child: Padding(
                     padding: const EdgeInsets.only(
                       top: 30,
                       bottom: 10,
                       left: 8
                     ),
                     child: Text('Todos directos reservados @DevApp 2019'),
                   ),
                 )
               ],
             ),
           ),
        ),
      ),
    );
  }
}