import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poliappflutter/models/pesaje.dart';

class PesajeService {
  Future<List<DataModel>> getAll() async {
    const url = 'http://192.168.100.25:85/api/pesaje';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final pesajes = json.map((e) {
        return DataModel(
          id: e['id'],
          material: e['material'],
          pesoneto: e['pesoneto'],
          evidencia: e['evidencia'],
          sucursal: e['sucursal'],
          proveedor: e['proveedor'],
          reporte: e['reporte'],

        );
      }).toList();
      return pesajes;
    }
    return [];
    // throw "Something went wrong";
  }
}
