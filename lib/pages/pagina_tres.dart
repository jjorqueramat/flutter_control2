import '../pages/pages.dart';

class PaginaTres extends StatefulWidget {
  @override
  _PaginaDosState createState() => _PaginaDosState();
}

class _PaginaDosState extends State<PaginaTres> {
  final List<String> images = [
    'assets/curso1.jpg',
    'assets/curso2.jpg',
    'assets/curso3.jpg',
    'assets/curso4.jpg',
    'assets/curso5.jpg',
    'assets/curso6.jpg',
    'assets/curso1.jpg',
    'assets/curso2.jpg',
  ];

  final List<List<String>> texts = [
    [
      'eICFE1119-07 | COMPUTACIÓN MÓVIL ',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'COMPUTACIÓN MÓVIL'
    ],
    [
      'TeICFE1116-07 | EVALUACIÓN DE P. INFORMÁTICOS',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'EVAL. P INFORMÁTICOS'
    ],
    [
      'eICFE1113-07 | INGENIERÍA DE DISEÑO',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'INGENIERÍA DE DISEÑO'
    ],
    [
      'ePEUM1002-02 | ESTADÍSTICA',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'ESTADÍSTICA'
    ],
    [
      'eICFE1105-07 | INGENIERÍA DE SOFTWARE',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'ING DE SOFTWARE'
    ],
    [
      'eICFE1103-07 | BASE DE DATOS',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'BASE DE DATOS'
    ],
    [
      'eFGUM1513-02 | SUSTENTABILIDAD Y MEDIOAMBIENTE',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'SUST Y MEDIOAMBIENTE'
    ],
    [
      'eFGIN1102-60 | INGLÉS II',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'INGLÉS II'
    ],
  ];

  int elementosPorPage = 6;

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Calificaciones',
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Spacer(),
              DropdownButton<int>(
                value: elementosPorPage,
                onChanged: (value) {
                  setState(() {
                    elementosPorPage = value!;
                  });
                },
                items:
                    <int>[2, 4, 6, 8].map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
              const SizedBox(width: 10),
              const Text(
                'Elementos por página: ',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              if (index < elementosPorPage) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            texts[index][0],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            // Centro del segundo texto
                            child: Text(
                              texts[index][1],
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Divider(),
                          Row(
                            // Row para alinear el tercer texto a la derecha

                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                // Hipervínculo para el tercer texto
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaginaNotas(
                                          nombreRamo: texts[index][
                                              3]), // Pasar el nombre del ramo como argumento
                                    ),
                                  );
                                },
                                child: Text(
                                  texts[index][2],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
