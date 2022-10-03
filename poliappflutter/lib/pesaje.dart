import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poliappflutter/models/api_services.dart';

class Pesaje extends StatefulWidget {
  const Pesaje({super.key});

  @override
  State<StatefulWidget> createState() => _PesajeState();
}

class _PesajeState extends State<Pesaje> {
  late List<Pesaje> pesaje;

  getPesaje() {
    APIServices.fetchPesaje().then((response) {
      Iterable list = json.decode(response.body);
      List<Pesaje> pesajeList = List<Pesaje>.empty();

      // pesajeList=list.map((model)=> Pesaje.fromObject(model)).toList();

      setState(() {
        pesaje = pesajeList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesaje'),
      ),
      body: ListView.builder(
          // itemCount: pesaje.lenght,
          itemBuilder: (context, index) {
        return const Card(
          color: Colors.white,
          child: ListTile(
              title: ListTile(
            // title:Text(pesaje[index].evidencia),
            onTap: null,
          )),
        );
      }),
    );
  }
}
