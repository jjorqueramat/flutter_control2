import '../pages/pages.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/home.jpg',
                width: 400,
                height: 150,
              ),
              const SizedBox(height: 1),
              Image.asset(
                'assets/home2.jpg',
                width: 300,
                height: 250,
              ),
              const SizedBox(height: 30),
              Table(
                border: TableBorder.all(),
                children: [
                  _buildTableRow(context, 'Recursos de apoyo al estudiante'),
                  _buildTableRow(context, 'Soporte Campus Virtual'),
                  _buildTableRow(
                      context, 'Código de conducta en Campus Virtual'),
                  _buildTableRow(context, 'Sistema de Biblioteca (Sibum)'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(BuildContext context, String text) {
    return TableRow(
      children: [
        TableCell(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Construccion(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
