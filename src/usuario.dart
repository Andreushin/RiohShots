import 'publicacion.dart';
import 'mensaje.dart';
import 'chat.dart';
import 'notificacion.dart';

class Usuario {
  String nombre;
  String nombreUsuario;
  List<Usuario> siguiendo;
  List<Chat> chats;
  List<Notificacion> notificaciones;

  bool _privado;

  Usuario({
    required this.nombre,
    required this.nombreUsuario,
    List<Usuario>? siguiendo,
    List<Chat>? chats,
    List<Notificacion>? notificaciones,
    bool privado = false,
  })  : siguiendo = siguiendo ?? [],
        chats = chats ?? [],
        notificaciones = notificaciones ?? [],
        _privado = privado;

  bool get privado => _privado;
  set privado(bool value) => _privado = value;

  /// Sigue a otro [Usuario]. No se puede seguir a sí mismo ni repetir usuarios.
  void seguir(Usuario usuario) {
    if (usuario != this && !siguiendo.contains(usuario)) {
      siguiendo.add(usuario);
    }
  }

  /// Publica una [Publicacion] (o cualquiera de sus subclases: Historia, Reel).
  void publicar(Publicacion post) {
    post.autor = this;
  }

  /// Busca un chat existente con [destinatario]; si no existe, lo crea.
  Chat _obtenerOCrearChat(Usuario destinatario) {
    for (final chat in chats) {
      if (chat.participantes.contains(this) &&
          chat.participantes.contains(destinatario)) {
        return chat;
      }
    }
    final nuevoChat = Chat(participantes: [this, destinatario]);
    chats.add(nuevoChat);
    destinatario.chats.add(nuevoChat);
    return nuevoChat;
  }

  /// Envía un [Mensaje] a otro [Usuario], usando (o creando) el
  /// [Chat] correspondiente entre ambos.
  void enviarMensaje(Usuario destinatario, Mensaje mensaje) {
    final chat = _obtenerOCrearChat(destinatario);
    chat.agregarMensaje(mensaje);
  }

  @override
  String toString() => '@$nombreUsuario';

  @override
  bool operator ==(Object other) =>
      other is Usuario && other.nombreUsuario == nombreUsuario;

  @override
  int get hashCode => nombreUsuario.hashCode;
}
