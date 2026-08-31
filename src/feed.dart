import 'usuario.dart';
import 'publicacion.dart';
import 'reel.dart';

class Feed {
  Usuario usuario;
  List<Publicacion> publicaciones;

  Feed({
    required this.usuario,
    List<Publicacion>? publicaciones,
  }) : publicaciones = publicaciones ?? [];

  void generar() {
  }

  void actualizar() {
  }

  /// Relevancia = likes + reproducciones 
  int _relevancia(Publicacion p) => p.likes + (p is Reel ? p.reproducciones : 0);

  void ordenarPorRelevancia() {
    publicaciones.sort((a, b) => _relevancia(b).compareTo(_relevancia(a)));
  }
}
