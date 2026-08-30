import 'publicacion.dart';
import 'mensaje.dart';

class Usuario {
  String nombre;
  String nombreUsuario;
  List<Usuario> siguiendo = [];

  bool _privado;

  Usuario({
    required this.nombre,
    required this.nombreUsuario,
    required bool privado,
  }) : _privado = privado;

  bool get privado => _privado;

  void seguir(Usuario usuario) {
    siguiendo.add(usuario);
  }

  void publicar(Publicacion post) {
  }

  void enviarMensaje(Usuario destinatario, Mensaje mensaje) {
  }
}
