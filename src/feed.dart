import 'usuario.dart';
import 'publicacion.dart';

class Feed {
  Usuario usuario;
  List<Publicacion> publicaciones = [];

  Feed({required this.usuario});

  void generar() {
  }

  void actualizar() {
    generar();
  }

  void ordenarPorRelevancia() {
    publicaciones.sort((a, b) => b.likes.compareTo(a.likes));
  }
}
