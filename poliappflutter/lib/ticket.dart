import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tickets".toUpperCase(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(height: 15.0),
              _bottonTicket(),
              Divider(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Icon(
                      Icons.photo,
                      color: Colors.green,
                      size: 30.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Proveedor,", style: TextStyle(fontSize: 15)),
                      Text("Civic Type R GT ", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
              //PARAAGREGAR OTRO
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
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
      );
      return ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ticket()),
          );
        },
        child: Text('Actualizar',
            style: TextStyle(color: Colors.white, fontSize: 13.0)),
      );
    });
  }
}
