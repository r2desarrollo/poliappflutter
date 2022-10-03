
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 45.0),
              Text(
                "TICKETS".toUpperCase(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25.0),
              _bottonTicket(),
              const SizedBox(
                height: 25.0,
              ),
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Proveedor '),
                  ),
                  DataColumn(label: Text('Material')),
                  DataColumn(label: Text('Monto')),
                  DataColumn(label: Text('')),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text("Juan")),
                      const DataCell(Text("PetNat")),
                      const DataCell(Text("80")),
                      DataCell((_bottonPhoto())),
                    ],
                  ),
                  DataRow(cells: <DataCell>[
                    const DataCell(Text("Saul")),
                    const DataCell(Text("PetVerde")),
                    const DataCell(Text("100")),
                    DataCell((_bottonPhoto()))
                  ]),
                  DataRow(cells: <DataCell>[
                    const DataCell(Text("Raul")),
                    const DataCell(Text("Soplo")),
                    const DataCell(Text("150")),
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
        foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 23, 182, 103),
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
        child: const Text('Actualizar',
            style: TextStyle(color: Colors.white, fontSize: 13.0)),
      );
    });
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
