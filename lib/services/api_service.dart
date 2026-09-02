import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseurl = "http://10.0.2.2/Api_PHP_Prueba";

  Future<Map<String, dynamic>> obtenerRespuesta() async {
    final url = Uri.parse(_baseurl + "/prueba_funcionalidad.php");

    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return jsonDecode(respuesta.body);
    } else {
      throw Exception('Error HTTP_ ${respuesta.statusCode}');
    }
  }
}
