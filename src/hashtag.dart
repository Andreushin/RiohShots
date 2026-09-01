import 'publicacion.dart';

/// Etiqueta que agrupa [Publicacion]es relacionadas.
class Hashtag {
  String etiqueta;
  List<Publicacion> publicaciones;

  Hashtag({
    required this.etiqueta,
    List<Publicacion>? publicaciones,
  }) : publicaciones = publicaciones ?? [];

  void agregarPublicacion(Publicacion post) {
    if (!publicaciones.contains(post)) {
      publicaciones.add(post);
    }
  }

  int contarUsos() => publicaciones.length;
}
