import 'contenido.dart';

class Mensaje extends Contenido {
  // PRIVADO: solo marcarLeido() cambia el estado de lectura.
  bool _leido = false;

  Mensaje({
    required super.urlMultimedia,
    required super.descripcion,
    required super.fecha,
  });

  /// Atajo para mensajes de solo texto (sin multimedia).
  Mensaje.texto(String texto)
      : super(urlMultimedia: '', descripcion: texto, fecha: DateTime.now());

  bool get leido => _leido;

  void marcarLeido() {
    _leido = true;
  }
}
