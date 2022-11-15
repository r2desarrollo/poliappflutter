import 'dart:html';

import 'package:provider/provider.dart';
import 'clasif.dart';
import 'package:poliappflutter/models/pesaje.dart';
import 'package:poliappflutter/providers/pesaje_provider.dart';
import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});
  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PesajeProvider>(context, listen: false).getAllPesajes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 182, 103),
        title: Text('Tickets'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => print('hi on icon action'),
          ),
        ],
      ),
      body: Consumer<PesajeProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          body:
          Column(
            children: <Widget>[
              Container(
                height: 40.0,
                child: Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(4.0),
                        width: 100.0,
                        child: const Text(
                          "Proveedor",
                          style: TextStyle(fontSize: 18),
                        )),
                    Container(
                        padding: EdgeInsets.all(4.0),
                        width: 100.0,
                        child: const Text(
                          "Material",
                          style: TextStyle(fontSize: 18),
                        )),
                    Container(
                        padding: EdgeInsets.all(4.0),
                        width: 100.0,
                        child: const Text(
                          "Monto",
                          style: TextStyle(fontSize: 18),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    final pesajes = value.pesajes;
                    return ListView.builder(
                      itemCount: pesajes.length,
                      itemBuilder: (context, index) {
                        final pesaje = pesajes[index];
                        return ListTile(
                            leading: CircleAvatar(
                              child: Text(pesaje.id.toString()),
                            ),
                            title: Text(
                              pesaje.evidencia,
                              style: const TextStyle(),
                            ),
                            trailing: (_bottonPhoto()));
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _bottonPhoto() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 23, 182, 103),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
      );
      return ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Clasif()),
          );
        },
        child: const Icon(Icons.add_a_photo),
      );
    });
  }
}
