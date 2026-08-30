import 'usuario.dart';
import 'mensaje.dart';
import 'notificacion.dart';

class Chat {
  List<Usuario> participantes;
  List<Mensaje> mensajes = [];

  // PRIVADO: solo silenciar()/activarNotificaciones() lo cambian.
  bool _silenciado = false;

  Chat({required this.participantes});

  bool get silenciado => _silenciado;

  int get noLeidos => mensajes.where((m) => !m.leido).length;

  void agregarMensaje(Mensaje mensaje) {
    mensajes.add(mensaje);
    if (_silenciado) return; // chat silenciado: no notifica
    for (final participante in participantes) {
      participante.notificaciones.add(
        Notificacion(
          tipo: 'mensaje_chat',
          fecha: DateTime.now(),
          origen: mensaje,
        ),
      );
    }
  }

  void silenciar() {
    _silenciado = true;
  }

  void activarNotificaciones() {
    _silenciado = false;
  }
}
