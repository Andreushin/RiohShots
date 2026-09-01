import 'usuario.dart';

/// Comentario dentro de una [Publicacion]. Puede tener respuestas anidadas
class Comentario {
  String texto;
  Usuario autor;
  DateTime fecha;
  List<Comentario> respuestas;

  Comentario({
    required this.texto,
    required this.autor,
    required this.fecha,
    List<Comentario>? respuestas,
  }) : respuestas = respuestas ?? [];

  void eliminar() {
  }

  void responder(Comentario respuesta) {
    respuestas.add(respuesta);
  }
}
