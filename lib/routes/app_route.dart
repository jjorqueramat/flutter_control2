import '../pages/pages.dart';

class AppRoutes {
  // ignore: constant_identifier_names
  static const InitialRoute = '/';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const Menu(
          title: 'Pagina de la Institucion',
          child: MyHomePage(),
        ),
    '/paginaUno': (context) => PaginaUno(),
    '/paginaDos': (context) => PaginaDos(),
    '/paginaTres': (context) => PaginaTres(),
  };
  static Route<dynamic> onGenerateRoute(RouteSettings) {
    return MaterialPageRoute(builder: (context) => const Construccion());
  }
}
