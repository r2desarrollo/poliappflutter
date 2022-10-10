import 'package:poliappflutter/constants.dart';
import 'package:poliappflutter/models/usuario.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

final urlapi = url;
class Usuario_provider with ChangeNotifier{
  String email = "";
  String password = "";
  
  List<Usuario> usuarios = [];

  Usuario_Provider(){
    getUsuarios();
  }

  getUsuarios() async {
    final url1 = Uri.http(urlapi, 'api/usuario');
    final resp = await http.get(url1, headers: {
       "Access-Control-Allow-Origin": "*",
       "Acces-Control-Allow-Credentials": "true",
       'Content-type': 'application/json',
       'Accept' : 'application/json'
    });

    final response = usuarioFromJson(resp.body);
    usuarios = response;
    notifyListeners();
  }
}