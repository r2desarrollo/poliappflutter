import 'package:flutter/widgets.dart';
import 'package:poliappflutter/constants.dart';
import 'package:poliappflutter/models/pesaje.dart';
import 'package:http/http.dart' as http;

final urlapi = url;
class Pesaje_provider with ChangeNotifier{
  List<Pesaje> pesajes = [];

  getPesajes() async {
    final url1 = Uri.http(urlapi, 'api/pesaje');
    final resp = await http.get(url1, headers: {
      "Acces-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });

    final response = pesajeFromJson(resp.body);
    pesajes = response;
    notifyListeners();
  }
}