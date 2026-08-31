import 'publicacion.dart';
import 'usuario.dart';
import 'mensaje.dart';

class Reel extends Publicacion {
  int duracionSegundos;
  String musica;
  int _reproducciones = 0;

  Reel({
    required super.urlMultimedia,
    required super.descripcion,
    required super.fecha,
    super.autor,
    required this.duracionSegundos,
    required this.musica,
  });

  int get reproducciones => _reproducciones;

  void reproducir() {
    if (eliminado) return;
    _reproducciones++;
  }

  void compartir(Usuario destinatario) {
    final emisor = autor;
    if (emisor == null) return;
    final mensaje = Mensaje(
      urlMultimedia: urlMultimedia,
      descripcion: 'Reel compartido: $descripcion',
      fecha: DateTime.now(),
    );
    emisor.enviarMensaje(destinatario, mensaje);
  }
}
