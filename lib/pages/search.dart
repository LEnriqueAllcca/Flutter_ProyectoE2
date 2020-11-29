import 'dart:convert';

import 'package:evaluacion2/services/searchNombre_service.dart';
import 'package:evaluacion2/services/searchRuc.dart';
import 'package:evaluacion2/services/search_service.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchResults = [];
  String _valor;

  searchDjango(value) async {
    SearchService.searchDjangoApi(value).then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      setState(() {
        data.forEach((value) {
          searchResults.add(value);
        });
      });
    });
  }
  
  searchDjango1(value1) async {
    SearchService1.searchDjangoApi(value1).then((responseBody) {
      List<dynamic> data1 = jsonDecode(responseBody);
      setState(() {
        data1.forEach((value1) {
          searchResults.add(value1);
        });
      });
    });
  }

  searchDjango2(value2) async {
    SearchService2.searchDjangoApi(value2).then((responseBody2) {
      List<dynamic> data2 = jsonDecode(responseBody2);
      setState(() {
        data2.forEach((value2) {
          searchResults.add(value2);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Buscador"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: <Widget>[
              Text(" Tipo de institución     "),
              DropdownButton<String>(
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  value: _valor,
                  items: [
                    DropdownMenuItem(
                      child: Text("Ipreda"),
                      value: "Ipreda",
                    ),
                    DropdownMenuItem(
                      child: Text("ONG"),
                      value: "ONG",
                    ),
                    DropdownMenuItem(
                      child: Text("ENIEX"),
                      value: "ENIEX",
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      _valor = value;
                      searchResults.clear();
                      searchDjango(value);
                    });
                  }),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Nombre de la institución:',style: TextStyle(color: Colors.blue,fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val2) {
                searchResults.clear();
                searchDjango1(val2);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 25.0),
                hintText: 'Escribe aqui',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('RUC:',style: TextStyle(color: Colors.blue,fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val1) {
                 searchResults.clear();
                  searchDjango2(val1);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 25.0),
                hintText: 'Escribe aqui',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ListView.builder(
                shrinkWrap: true,
                itemCount: searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildResultCard(searchResults[index]);
                }),
        ],
      ),
    );
  }
}

Widget buildResultCard(data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Divider(
          color: Colors.red,
          height: 20,
            thickness: 3,
            indent: 0,
            endIndent: 10,
          ),
        ListTile(
          title: Text('Instituto: ' + data['nombInsti']),
          subtitle: Text('Ruc: ' + data['Ruc'].toString()+
                        '\n'+data['Email'].toString()+
                        '\nRepresentante:'+data['Representante']),
          leading: new Icon(
            Icons.apartment_rounded,
            size: 40,
            color: Colors.blue.shade700,
            ),
          onTap: (){},
        ),
      ],
    ),
  );
}
