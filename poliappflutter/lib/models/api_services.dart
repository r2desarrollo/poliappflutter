import 'package:http/http.dart' as http;

class APIServices{

  static String pesajeUrl ='http://192.168.100.25:85/api/pesaje';

  static Future fetchPesaje() async{
    return await http.get(Uri.parse(pesajeUrl));
    
  }
}

