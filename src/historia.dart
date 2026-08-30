import 'publicacion.dart';
import 'usuario.dart';

class Historia extends Publicacion {
  int duracionHoras;

  // PRIVADO: su unico punto de cambio valido es marcarVista().
  bool _vista = false;

  Historia({
    required super.urlMultimedia,
    required super.descripcion,
    required super.fecha,
    this.duracionHoras = 24,
  });

  bool get vista => _vista;

  DateTime get fechaExpiracion => fecha.add(Duration(hours: duracionHoras));

  bool get haExpirado => DateTime.now().isAfter(fechaExpiracion);

  void marcarVista(Usuario usuario) {
    if (eliminado || haExpirado) return;
    if (identical(usuario, autor)) return; // el autor no cuenta como vista
    _vista = true;
  }

  /// Se elimina sola cuando ya se cumplieron las duracionHoras.
  void expirar() {
    if (haExpirado) eliminar();
  }
}
