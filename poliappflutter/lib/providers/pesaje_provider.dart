import 'package:flutter/cupertino.dart';
import 'package:poliappflutter/models/pesaje.dart';
import 'package:poliappflutter/services/pesaje_services.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class PesajeProvider extends ChangeNotifier {
  final _service = PesajeService();
  bool isLoading = false;
  List<DataModel> _pesajes = [];
  List<DataModel> get pesajes => _pesajes;

  Future<void> getAllPesajes() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _pesajes = response;
    isLoading = false;
    notifyListeners();
  }



}
