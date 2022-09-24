import 'package:flutter/material.dart';
import 'ticket.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¡PESADOR!".toUpperCase(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Flexible(
                child: Image.asset(
                  '../imagenes/poli.jpeg',
                  height: 180.0,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Nombre del pesador",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              _bottonTicket(),
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
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
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
        child: Text('REVISIÓN DE TICKETS',
            style: TextStyle(color: Colors.white, fontSize: 16.0)),
      );
    });
  }
}