import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:poliappflutter/models/api_services.dart';
import 'package:poliappflutter/models/pesaje.dart';

class Pesaje extends StatefulWidget {
  const Pesaje({super.key});

  State<StatefulWidget> createState() => _PesajeState();
}

class _PesajeState extends State<Pesaje>{
  late List<Pesaje> pesaje;

  getPesaje(){
    APIServices.fetchPesaje().then((response){
    Iterable list=json.decode(response.body);
    List<Pesaje> pesajeList = List<Pesaje>.empty();

    pesajeList=list.map((model)=> Pesaje.fromObject(model)).toList();

    setState(() {
      pesaje = pesajeList;
    });
  });
}

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesaje'),
      ),
      body: ListView.builder(
        itemCount: pesaje.lenght,
        itemBuilder: (context,index){
          return Card(
            color: Colors.white,
            child: ListTile(
              title: ListTile(
                title:Text(pesaje[index].evidencia),
                onTap: null,
              )
            ),
          );
        }),
    );
  }
}
