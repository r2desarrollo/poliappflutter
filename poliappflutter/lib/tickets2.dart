// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'clasif.dart';

void main() => runApp(const Tickets2());

class Tickets2 extends StatefulWidget {
  const Tickets2({super.key});

  @override
  _Tickets2State createState() => _Tickets2State();
}

class _Tickets2State extends State<Tickets2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo App1"),
        ),
        body: Column(
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
                  return Row(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.all(4.0),
                          width: 100.0,
                          child: Text(
                            "Name $index",
                            style: const TextStyle(fontSize: 18),
                          )),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        width: 100.0,
                        child: Text(
                          "Age $index",
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
