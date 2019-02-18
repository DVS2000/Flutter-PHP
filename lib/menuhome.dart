import 'dart:convert';

import 'package:aula4/details.dart';
import 'package:aula4/edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
    final List list;
    final int index;


   Menu({this.list, this.index});
  
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {


  void _logout() {
    AlertDialog alert = new AlertDialog(
      title: Text('Terminar sessão'),
      content:
          Text('Deseja terminar sessão ?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Sim'),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('Home', (Route<dynamic> route) => false);
          },
        ),
        FlatButton(
          child: Text('Não'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );

    showDialog(context: context, child : alert);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(
              top: 5
            ),
            width: 50,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50)
              )
            ),
          child: Center(
            child: Icon(Icons.first_page, color: Colors.purple, size: 50,),
          )
        ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message, color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.input, color: Colors.white,),
            onPressed: () {
              _logout();
            },
          )
        ],
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: 'Perfil',
            ),
            Tab(
              text: 'Usuários',
            )
          ],
        ),
      ),
      body: TabBarView(
          children: [

            // ====================================================
            // ====================================================
            // ==============PERFIL================================

            SingleChildScrollView(
      child: new Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
             Image.network(
                  'http://192.168.1.248/login/imgs/imgs.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                ),

                new Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.all(16),
                  color: Colors.purple,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child:   new Text(
                        "Nome : ${widget.list[widget.index]['nome']}", overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0
                        ),
                      ),
                    ),
                    new Text(
                        "Telefone : ${widget.list[widget.index]['telefone']}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0
                        ),
                      ),
                    ],
                  ),
                ),

                new Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.phone, size: 35, color: Colors.purple,),
                            onPressed: (){},
                          ),
                          Text(
                            'Chamada',
                            style: TextStyle(
                              color: Colors.purple
                            ),
                          )
                        ],
                      ),

                       Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.star, size: 35, color: Colors.purple,),
                            onPressed: (){},
                          ),
                          Text(
                            'Favoritos',
                            style: TextStyle(
                              color: Colors.purple
                            ),
                          )
                        ],
                      ),

                       Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.language, size: 35, color: Colors.purple,),
                            onPressed: (){},
                          ),
                          Text(
                            'Site',
                            style: TextStyle(
                              color: Colors.purple
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width / 1.06,
                  child: Divider(),
                ),

                new Container(
                  margin: const EdgeInsets.only(left: 20, right: 12),
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Sobre : '.toUpperCase(), style: TextStyle(color: Colors.purple),),
                      Text(
                    'Dorivaldo Vicente dos Santos , tenho 18 de idade e sonho ser um grande programdor a nível nacional.',
                     style: TextStyle(fontStyle: FontStyle.italic),
                     ),
                    ],
                  )
                ),
 
                Container(
                  width: MediaQuery.of(context).size.width / 1.06,
                  child: Divider(),
                ),

                new Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.location_on, color: Colors.purple,),
                        onPressed: (){},
                      ),
                      Text('Luanda, Belas, Samba-Camuxiba')
                    ],
                  ),
                ),

                  Container(
                  width: MediaQuery.of(context).size.width / 1.06,
                  child: Divider(),
                ),

                  new Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.school, color: Colors.purple,),
                        onPressed: (){},
                      ),
                      Text('Instituto Médio Policténico Alda Lara (IMPAL)')
                    ],
                  ),
                ),

                  Container(
                  width: MediaQuery.of(context).size.width / 1.06,
                  child: Divider(),
                ),
              
            ],
          ),

          new Positioned(
            top: 200.0,
            right: 0.0,
            child: FractionalTranslation(
              translation: const Offset(-0.5, -0.5),
              child: new FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.purple,
                child: new Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Edit(list: widget.list, index: widget.index,)
                    )
                  );
                },
              ),
            ),
          ), 
        ],
      ),
    ),
            // ====================================================
            // ====================================================

            Users()
          ],   
      ),
    
    ),
    );
  }
}




class Users extends StatefulWidget {
  final List list;
  final int index;

  Users({this.list, this.index});
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {

    TextEditingController csearch = new TextEditingController();

  // ============================
  // GETDATA-> PEGA TODOS VALORES 
  // DO BANCO DE DE DADOS E
  // CONVERTE PARA JSON
  // ===========================
  Future<List> getData({String search = ''}) async {
    final response = await http.get("http://192.168.1.248/login/getAll.php?search=${search.trim()}");
    //print(response.body);
    return json.decode(response.body);
  }
  

  // ===================================
  // FUNÇÃO PARA PESQUISAR EM TEMPO REAL
  // ===================================
  String _search = '';
  void search(String value) {
    getData();
      setState(() {
       _search = value; 
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

           Align(
            alignment: Alignment.topCenter, 
            child: Container(
              margin: const EdgeInsets.only(top: 13,),
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 0,
                left: 0,
                right: 16
              ),
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10
                )
              ]
            ),
            child: TextField(
              onChanged: (value) {
                search(value);
              },
             
              decoration: InputDecoration(
                hintText: 'Pesquisar',
                icon: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8
                      )
                    ]
                  ),
                  child: Icon(Icons.search, color: Colors.purple,),
                ),
                border: InputBorder.none
              ),
            ),
        ),
          ),


        Container(
          margin: const EdgeInsets.only(top: 62),
         
          child:   FutureBuilder(
              future: getData(search: _search),
              builder: (context, ss) {
                if (ss.hasError) {
                  print('Ocorreu um erro');
                }
                if (ss.hasData) {
                  return Items(list: ss.data); 
                }
                else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
           ),
        )
      ],
    );
  }
}


class Items extends StatelessWidget {

  // =================================
  // ==================DELETE=========
  // =================================
  void delete(int id) {
    var url = "http://192.168.1.248/login/deleteuser.php";
    http.post(url, body: {
      "id": id
    });
    print('Chegou');
  }


  List list;
  Items({this.list});
  @override
  Widget build(BuildContext context) {


   


    return ListView.builder(
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, i) {
            return  Column(
              children: <Widget>[
                ListTile(
              leading: CircleAvatar(
                child: Text('${list[i]['nome'].toString().substring(0,1)}'),
              ),
              title: Text(list[i]['nome']),
              subtitle: Text(list[i]['email']),
              onTap: () {
                   Navigator.of(context).push(
                   MaterialPageRoute(
                     builder: (BuildContext context) => Details(list: list, index: i,)
                   )
                );
              }
                   
            ), 
            Container(
              width: MediaQuery.of(context).size.width / 1.06,
              child: Divider(),
            )
              ],
            );
          } 
    );
  }
}