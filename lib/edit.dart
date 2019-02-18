import 'dart:convert';
import 'package:aula4/menuhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as htt;

class Edit extends StatefulWidget {
  final List list;
  final int index;

  Edit({this.list, this.index});
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  // ======================================================
  // ======================CAMPOS==========================
  // ======================================================
  TextEditingController _nome;
  TextEditingController _email;
  TextEditingController _telefone;
  TextEditingController _senha;

  // ========================================================
  // =====================ADD NEW USER=======================
  // ========================================================

  void edituser() {
    var url = 'http://192.168.1.248/login/edituser.php';
    htt.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nome":_nome.text.trim(),
      "email":_email.text.trim(),
      "telefone":_telefone.text.trim(),
      "senha":_senha.text.trim()
    });

      Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => Menu()
              ),
              
              (Route<dynamic> route) => false

              );   
    
  }


  @override
  void initState() {

    // ==========================================
    // ========== Iniciar com a Tela Cheia======
    SystemChrome.setEnabledSystemUIOverlays([]);

    //================================================================================
    // =========== Preencher todos TextField ==========================================
    _nome = TextEditingController(text: widget.list[widget.index]['nome']);
    _email = TextEditingController(text: widget.list[widget.index]['email']);
    _telefone = TextEditingController(text: widget.list[widget.index]['telefone']);
    // ================================================================================

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
            Navigator.of(context).pushNamedAndRemoveUntil('Menu', (Route<dynamic> route) => false);
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
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 170,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8
                          )
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("http://192.168.1.248/login/imgs/imgs.jpg")
                        )
                      ),
                    ),
                     
                 Positioned(
                   top: 110,
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
                        print('Clicou em abrir foto');
                       // ====================================
                      
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
                       'Editar usuário',
                       style: TextStyle(
                         color: Colors.white, fontSize: 15
                       ),
                     ),
                     onPressed: (){
                       // ======================================
                       // ===== Chamanddo a função Editar user=
                       edituser();
                       // =================================
                       
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