import 'package:flutter/cupertino.dart';
import 'package:poliappflutter/models/pesaje.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;


final urlapi = url;
class Pesaje_provider with ChangeNotifier{
  List<Pesaje> pesajes = [];

  Pesaje_provider(){
    getPesajes();
  }

  getPesajes() async {
    final url1 = Uri.http(urlapi, 'api/pesaje');
    final resp = await http.get(url1, headers: {
       "Access-Control-Allow-Origin": "*",
       "Acces-Control-Allow-Credentials": "true",
       'Content-type': 'application/json',
       'Accept' : 'application/json'
    });

    final response = pesajeFromJson(resp.body);
    pesajes = response;
    notifyListeners();
  }
}