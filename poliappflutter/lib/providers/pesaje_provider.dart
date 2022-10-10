import 'package:poliappflutter/constants.dart';
import 'package:poliappflutter/models/pesaje.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

const urlapi = url;

class Pesaje_provider with ChangeNotifier {


  List<Pesaje> pesajes = [];

  Pesaje_provider() {
    getPesajes();
  }

  getPesajes() async {
    final url1 = Uri.http(urlapi, 'api/pesaje');
    final resp = await http.get(url1, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    final response = pesajeFromJson(resp.body);
    pesajes = response;
    notifyListeners();
  }
}