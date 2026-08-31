import 'contenido.dart';

class Mensaje extends Contenido {
  bool _leido;

  Mensaje({
    required super.urlMultimedia,
    required super.descripcion,
    required super.fecha,
    bool leido = false,
  }) : _leido = leido;

  bool get leido => _leido;

  void marcarLeido() {
    _leido = true;
  }

  @override
  void eliminar() {
    super.eliminar();
  }
}
