import 'contenido.dart';
import 'comentario.dart';
import 'usuario.dart';

class Publicacion extends Contenido {
  // Se asigna al publicar() desde Usuario.
  Usuario? autor;

  List<Comentario> comentarios;
  int _likes;

  Publicacion({
    required super.urlMultimedia,
    required super.descripcion,
    required super.fecha,
    this.autor,
    List<Comentario>? comentarios,
    int likes = 0,
  })  : comentarios = comentarios ?? [],
        _likes = likes;

  int get likes => _likes;

  void darLike(Usuario usuario) {
    _likes++;
    autor?.notificaciones.add(generarNotificacion('like'));
  }

  void agregarComentario(Comentario comentario) {
    comentarios.add(comentario);
    autor?.notificaciones.add(generarNotificacion('comentario'));
  }

  @override
  void eliminar() {
    super.eliminar(); // marca _eliminado en Contenido
    comentarios.clear(); // limpieza propia de Publicacion
  }
}
