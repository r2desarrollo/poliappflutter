import 'package:flutter/material.dart';
import 'ticket.dart';

class Inicio extends StatefulWidget {
  static String id = 'inicio';

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 23, 182, 103),
          title: Text('Poliplasts'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.logout_rounded),
              onPressed: () => print('hi on icon action'),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¡HOLA, BIENVENIDO!".toUpperCase(),
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Flexible(
                child: Image.asset(
                  'imagenes/poli.jpeg',
                  height: 250.0,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const SizedBox(height: 20.0),
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
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 23, 182, 103),
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      );

      return ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Ticket()),
          );
        },
        child: const Text('REVISIÓN DE TICKETS',
            style: TextStyle(color: Colors.white, fontSize: 16.0)),
      );
    });
  }
}
