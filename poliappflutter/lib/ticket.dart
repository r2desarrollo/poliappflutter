import 'package:poliappflutter/models/pesaje.dart';
import 'package:poliappflutter/providers/pesaje_provider.dart';
import 'package:provider/provider.dart';

import 'clasif.dart';

import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
  final pesajeProvider = Provider.of<Pesaje_provider>(context);
  pesajeProvider.getPesajes();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 45.0),
              Text(
                "TICKETS".toUpperCase(),
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25.0),
              _bottonTicket(),
              SizedBox(
                height: 25.0,
              ),
              DataTable(
                columns: <DataColumn>[
                  new DataColumn(
                    label: Text('Proveedor '),
                  ),
                  new DataColumn(label: Text('Material')),
                  new DataColumn(label: Text('Monto')),
                  new DataColumn(label: Text('')),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("Juan")),
                      DataCell(Text("PetNat")),
                      DataCell(Text("80")),
                      DataCell((_bottonPhoto())),
                    ],
                  ),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("Saul")),
                    DataCell(Text("PetVerde")),
                    DataCell(Text("100")),
                    DataCell((_bottonPhoto()))
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("Raul")),
                    DataCell(Text("Soplo")),
                    DataCell(Text("150")),
                    DataCell((_bottonPhoto()))
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottonTicket() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: Color.fromARGB(255, 23, 182, 103),
        minimumSize: Size(88, 36),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
        child: Text('Actualizar',
            style: TextStyle(color: Colors.white, fontSize: 13.0)),
      );
    });
  }

  Widget _bottonPhoto() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 23, 182, 103),
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
        child: Icon(Icons.add_a_photo),
      );
    });
  }
}
