import 'package:aula4/edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  final List list;
  final int index;

  Details({this.list, this.index});
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

   void delete() {
    AlertDialog alert = new AlertDialog(
      title: Text('Eliminar'),
      content: Text("Eliminar o ${widget.list[widget.index]['nome']}", overflow: TextOverflow.ellipsis,),
      actions: <Widget>[
        FlatButton(
          child: Text('Sim'),
          onPressed: () {

            // ==========================================================
            // ==== Este URL Vai Pegar O ID os User E Vai Elimanar da BD
             var url = "http://192.168.1.248/login/deleteuser.php";
               http.post(url, body: {
                "id": widget.list[widget.index]['id']
                });
            Navigator.of(context).pushNamedAndRemoveUntil(
              'Menu', 
              (Route<dynamic> route) => false
              );
          },
          // ==============================================================
        ),
        FlatButton(
          child: Text('Não'),
          onPressed: () {
           Navigator.of(context).pop();
          },
        )
      ],
    );

    showDialog(context: context, child: alert);
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['nome']}"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
               // ==========================
              // ===== FUNÇÃO ELIMINAR ====
              delete();
             // ==========================
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
                // =========================
               // ======== Função Editar===
               Navigator.of(context).push(
                 MaterialPageRoute(
                   builder: (BuildContext context) => Edit(list: widget.list, index: widget.index,)
                 )
               );
              // =========================
            },
          )
        ],
      ),
      body: SingleChildScrollView(
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
                          "Telefone : ${widget.list[widget.index]['telefone']}", overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0
                          ),
                        ),
                      ),
                      new Text(
                          "Email : ${widget.list[widget.index]['email']}",
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

         
            
          ],
        ),
      ),
    );
  }
}