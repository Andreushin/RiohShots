import 'notificacion.dart';

abstract class Contenido {
  String urlMultimedia;
  String descripcion;
  DateTime fecha;

  bool _eliminado = false;

  Contenido({
    required this.urlMultimedia,
    required this.descripcion,
    required this.fecha,
  });

  bool get eliminado => _eliminado;

  void eliminar() {
    _eliminado = true;
  }
  /// las subclases (Publicacion, Mensaje) usan este método para crear la
  /// notificación que luego depositan en quien deba recibirla.
  Notificacion generarNotificacion(String tipo) {
    return Notificacion(tipo: tipo, fecha: DateTime.now());
  }
}
