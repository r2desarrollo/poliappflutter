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

  void onRefresh() {
    print('ounter value :');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PesajeProvider>(context, listen: false).getAllPesajes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 23, 182, 103),
          title: const Text('Provider API'),
        ),
        body: Center(
          child: Column(children: [
            const SizedBox(height: 20.0),
            _bottonTicket(),
            const SizedBox(height: 20.0),
            Consumer<PesajeProvider>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
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
                        style: TextStyle(),
                      ),
                    );
                  },
                );
              },
            ),
          ]),
        ));
  }

  Widget _bottonTicket() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 23, 182, 103),
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
      );
      return ElevatedButton(
        style: raisedButtonStyle,
        onPressed: onRefresh,
        child: const Text('Actualizar',
            style: TextStyle(color: Colors.white, fontSize: 15.0)),
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
