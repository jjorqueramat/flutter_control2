import '../pages/pages.dart';

class Construccion extends StatelessWidget {
  const Construccion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página en Contruccion'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Vuelve a la página anterior
          },
        ),
      ),
      body: const Center(
        child: Text(
          "Estamos Trabajando",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
