import 'contenido.dart';
import 'comentario.dart';
import 'usuario.dart';

class Publicacion extends Contenido {
  List<Comentario> comentarios = [];

  int _likes = 0;

  Publicacion({
    required super.urlMultimedia,
    required super.descripcion,
    required super.fecha,
  });

  int get likes => _likes;

  void darLike(Usuario usuario) {
    _likes++;
  }

  void agregarComentario(Comentario comentario) {
    comentarios.add(comentario);
  }
}
