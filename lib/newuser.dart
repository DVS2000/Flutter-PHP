import 'dart:convert';

import 'package:aula4/menuhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class NewUser extends StatefulWidget {
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {

  // ======================================================
  // ======================CAMPOS==========================
  // ======================================================
  TextEditingController _nome = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _telefone = new TextEditingController();
  TextEditingController _senha = new TextEditingController();

  // ========================================================
  // =====================ADD NEW USER=======================
  // ========================================================

  void addUser() {
    var url = 'http://192.168.1.248/login/adduser.php';
    http.post(url, body: {
      "nome":_nome.text.trim(),
      "email":_email.text.trim(),
      "telefone":_telefone.text.trim(),
      "senha":_senha.text.trim()
    });

    login();    

  }

  // ===============================
  // ===== Iniciar Sessão =========
  // =============================
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

         Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => Menu(list: data, index: 0,)
              ),
              
              (Route<dynamic> route) => false

              );   
      });
    }


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

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height / 1.1,
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 
                 Visibility(
                   visible: true,
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                   ),
                 ),
                Stack(
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
                 Positioned(
                   top: 150,
                   right: 10,
                   child: Container(
                     width: 50,
                     height: 80,
                     decoration: BoxDecoration(
                       color: Colors.purple,
                       shape: BoxShape.circle,
                       border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 2)
                     ),
                     child: IconButton(
                     icon: Icon(Icons.camera_alt, color: Colors.white,),
                     onPressed: () {

                       // ====================================
                       // ====== ABRIR FOTO ==================
                       // ====================================
                       print('Dorivaldo');
                     },
                   ),
                   )
                 )
                  ],
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
                     controller: _nome,
                     maxLength: 60,
                     decoration: InputDecoration(
                       hintText: 'Nome',
                       icon: Icon(Icons.person),
                       border: InputBorder.none
                     ),
                   ),
                 ),


                   Container(
                   margin: const EdgeInsets.only(
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
                     controller: _email,
                     keyboardType: TextInputType.emailAddress,
                     maxLength: 30,
                     decoration: InputDecoration(
                       hintText: 'Email',
                       icon: Icon(Icons.email),
                       border: InputBorder.none
                     ),
                   ),
                 ),


                   Container(
                   margin: const EdgeInsets.only(
                     
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
                       'CRIAR CONTA',
                       style: TextStyle(
                         color: Colors.white, fontSize: 15
                       ),
                     ),
                     onPressed: (){
                       print('Dorivaldo');
                       addUser();
                       
                       //----------FAZER LOGIN-----------//
                     },
                   )
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