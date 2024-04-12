import '../pages/pages.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> obtenerDatos() async {
    try {
      // Hacer la solicitud HTTP GET a la API
      var response = await http.get(Uri.parse(
          'https://sandeonline.cl:2082/taskfocus/maestros/api/FichaProducto/ObtenerDatosDesarrollador'));

      // Verificar si la solicitud fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        // Decodificar el JSON de la respuesta y devolver los datos obtenidos de la API
        return json.decode(response.body);
      } else {
        // Si la solicitud no fue exitosa, mostrar un mensaje de error
        print('Error: ${response.statusCode}');
        // Devolver un valor por defecto o manejar el error de otra manera según sea necesario
        return <String, dynamic>{}; // Devuelve un mapa vacío en caso de error
      }
    } catch (e) {
      // Capturar cualquier error durante la solicitud
      print('Error: $e');
      // Devolver un valor por defecto o manejar el error de otra manera según sea necesario
      return <String, dynamic>{}; // Devuelve un mapa vacío en caso de error
    }
  }
}
