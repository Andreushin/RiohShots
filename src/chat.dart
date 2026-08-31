import 'usuario.dart';
import 'mensaje.dart';
import 'notificacion.dart';

/// Chat: "contiene" [Mensaje] y en el que "participan" [Usuario].
class Chat {
  List<Usuario> participantes;
  List<Mensaje> mensajes;

  Chat({
    List<Usuario>? participantes,
    List<Mensaje>? mensajes,
  })  : participantes = participantes ?? [],
        mensajes = mensajes ?? [];

  void agregarMensaje(Mensaje mensaje) {
    mensajes.add(mensaje);
    for (final participante in participantes) {
      participante.notificaciones.add(
        Notificacion(tipo: 'mensaje_chat', fecha: DateTime.now()),
      );
    }
  }

  void silenciar() {
  }
}
