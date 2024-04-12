import '../pages/pages.dart';

class PaginaDos extends StatefulWidget {
  @override
  _PaginaDosState createState() => _PaginaDosState();
}

class _PaginaDosState extends State<PaginaDos> {
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
    ['eICFE1119-07', 'COMPUTACIÓN MÓVIL', 'RENE ALEJANDRO GALARCE'],
    [
      'TeICFE1116-07',
      'EVALUACIÓN DE P. INFORMÁTICOS',
      'CLEMENTE ANTONIO BAEZA'
    ],
    ['eICFE1113-07', 'INGENIERÍA DE DISEÑO', 'JORGE ESTEBAN CORNEJO'],
    ['ePEUM1002-02', 'ESTADÍSTICA', 'TERESA DEL CARMEN AGUILAR'],
    ['eICFE1105-07', 'INGENIERÍA DE SOFTWARE', 'JORGE ESTEBAN CORNEJO'],
    ['eICFE1103-07', 'BASE DE DATOS', 'ANA PAOLA ARRIAGADA'],
    ['eFGUM1513-02', 'SUSTENTABILIDAD Y MEDIOAMBIENTE', 'AMALIA ANDREA CASTRO'],
    ['eFGIN1102-60', 'INGLÉS II', 'LUCIA PATRICIA ABARCA'],
  ];

  int elementosPorPage = 6;

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Todos Los cursos',
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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dos columnas
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              if (index < elementosPorPage) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        images[index],
                        height: 90,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            texts[index][0],
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(height: 4),
                          Text(
                            texts[index][1],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(),
                          Text(
                            texts[index][2],
                            style: TextStyle(fontSize: 10),
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
