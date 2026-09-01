/// Notificación que recibe un [Usuario], generalmente generada
/// a partir de un Contenido (like, comentario, mensaje, etc.).
class Notificacion {
  String tipo;
  DateTime fecha;
  bool _leida;

  Notificacion({
    required this.tipo,
    required this.fecha,
    bool leida = false,
  }) : _leida = leida;

  bool get leida => _leida;

  void marcarLeida() {
    _leida = true;
  }

  void eliminar() {
    // Lógica para retirar la notificación de la bandeja del usuario.
  }
}
