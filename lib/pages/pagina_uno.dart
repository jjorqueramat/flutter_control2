import '../pages/pages.dart';

class PaginaUno extends StatefulWidget {
  @override
  _PaginaUnoState createState() => _PaginaUnoState();
}

class _PaginaUnoState extends State<PaginaUno> {
  String nombreCompleto = '';
  String email = '';
  String idEstudiante = '';

  @override
  void initState() {
    super.initState();
    obtenerDatosAlumno();
  }

  Future<void> obtenerDatosAlumno() async {
    ApiService apiService = ApiService();
    var data = await apiService.obtenerDatos();
    setState(() {
      nombreCompleto = data['nombre'];
      email = data['email'];
      idEstudiante = data['id'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Perfil',
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(195.0),
          child: AppBar(
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/fondo_pag1.jpg',
                  width: 360,
                  height: 160,
                ),
                const SizedBox(height: 5),
                Text(
                  nombreCompleto.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Información del Estudiante',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nombre Completo',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(nombreCompleto),
                        ],
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dirección de correo electrónico',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(email),
                        ],
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ID de estudiante',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(idEstudiante),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Configuración del sistema',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.black),
                children: const [
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Idioma',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Español (Chile UM)'),
                        ],
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ajustes de privacidad',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Solo los profesores pueden ver la información de mi perfil'),
                        ],
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ajustes de notificaciones generales',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Notificaciones de secuencias \n Notificaciones por correo electrónico \n Notificaciones emergentes'),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
