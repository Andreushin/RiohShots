// Taller de abstracción de objetos a partir de apps de uso diario
// App modelada: Instagram — RiohShots
// Universidad de La Guajira — Facultad de Ingeniería — Desarrollo Móvil
//
// Ejecutar:  dart run src/main.dart
//
// La demo se cuenta como una historia desde el punto de vista de
// @andreushin, para que se vea cómo interactúan las clases entre sí
// en vez de solo listar metodo por metodo.

import 'models.dart';

void _capitulo(String texto) {
  print('');
  print('--- $texto ---');
}

void main() {
  final andreushin = Usuario(nombre: 'Carlos Martinez', nombreUsuario: 'andreushin');
  final devGordon = Usuario(nombre: 'Carlos Zarate', nombreUsuario: 'dev_gordon');

  _capitulo('dev_gordon empieza a seguirte');
  devGordon.seguir(andreushin);
  final avisoSeguidor = andreushin.notificaciones.last;
  print('Notificacion nueva: "${avisoSeguidor.tipo}" (leida: ${avisoSeguidor.leida})');

  _capitulo('dev_gordon publica una foto que se pone viral');
  final fotoViral = Publicacion(
    urlMultimedia: 'https://cdn.riohshots/atardecer-muelle.jpg',
    descripcion: 'Atardecer en el muelle de Riohacha',
    fecha: DateTime.now(),
    likes: 50, // ya venia con 50 likes de otros usuarios
  );
  devGordon.publicar(fotoViral);
  print('${fotoViral.autor} publico algo y ya tiene ${fotoViral.likes} likes');

  _capitulo('tu tambien publicas algo, pero apenas vas empezando');
  final tuFoto = Publicacion(
    urlMultimedia: 'https://cdn.riohshots/mi-cafe.jpg',
    descripcion: 'Cafecito antes del taller',
    fecha: DateTime.now(),
  );
  andreushin.publicar(tuFoto);
  tuFoto.darLike(devGordon); // dev_gordon te devuelve el gesto
  print('Tu publicacion tiene ${tuFoto.likes} like(s) por ahora');

  _capitulo('abres tu feed');
  final feed = Feed(usuario: andreushin);
  feed.publicaciones.addAll([tuFoto, fotoViral]);
  feed.generar();
  feed.ordenarPorRelevancia();
  print('Feed de ${andreushin.nombreUsuario} ordenado por relevancia:');
  for (final p in feed.publicaciones) {
    print('  ${p.autor} -> "${p.descripcion}" (${p.likes} likes)');
  }
  print('Como se esperaba, la de dev_gordon te quedo hasta arriba.');

  _capitulo('le escribes a dev_gordon');
  final saludo = Mensaje(
    urlMultimedia: '',
    descripcion: 'Ey parce, ¿ya subiste el taller de abstraccion?',
    fecha: DateTime.now(),
  );
  andreushin.enviarMensaje(devGordon, saludo);
  print('${andreushin.nombreUsuario}: "${saludo.descripcion}"');

  final respuesta = Mensaje(
    urlMultimedia: '',
    descripcion: 'Si ya, subi el commit hace rato jaja',
    fecha: DateTime.now(),
  );
  devGordon.enviarMensaje(andreushin, respuesta); // se reutiliza el mismo chat
  print('${devGordon.nombreUsuario}: "${respuesta.descripcion}"');

  final chat = andreushin.chats.first;
  print('Ese chat ya lleva ${chat.mensajes.length} mensajes.');
  saludo.marcarLeido();
  print('Marcaste tu primer mensaje como leido: ${saludo.leido}');

  _capitulo('dev_gordon te comparte un reel');
  final reel = Reel(
    urlMultimedia: 'https://cdn.riohshots/timelapse-muelle.mp4',
    descripcion: 'Timelapse del muelle',
    fecha: DateTime.now(),
    duracionSegundos: 22,
    musica: 'Vallenato clasico',
  );
  devGordon.publicar(reel);
  reel.reproducir();
  reel.compartir(andreushin);
  print('Reel de ${reel.autor} con ${reel.reproducciones} reproduccion(es), compartido contigo.');

  _capitulo('subes una historia');
  final historia = Historia(
    urlMultimedia: 'https://cdn.riohshots/story-cafe.jpg',
    descripcion: 'Antes del taller',
    fecha: DateTime.now(),
    duracionHoras: 24,
  );
  andreushin.publicar(historia);
  historia.marcarVista(devGordon);
  print('dev_gordon vio tu historia: ${historia.vista} (expira en ${historia.duracionHoras}h)');

  // Historia aparte, ya vieja, solo para mostrar que expira sola.
  final historiaDeAyer = Historia(
    urlMultimedia: 'https://cdn.riohshots/story-vieja.jpg',
    descripcion: 'Historia de ayer',
    fecha: DateTime.now().subtract(Duration(hours: 30)),
    duracionHoras: 24,
  );
  historiaDeAyer.expirar();
  print('Una historia de ayer ya expiro y se elimino sola: ${historiaDeAyer.eliminado}');

  _capitulo('etiquetas el lugar');
  final hashtag = Hashtag(etiqueta: '#Riohacha');
  hashtag.agregarPublicacion(fotoViral);
  hashtag.agregarPublicacion(tuFoto);
  print('${hashtag.etiqueta} usado ${hashtag.contarUsos()} veces');

  _capitulo('comentas la foto viral de dev_gordon');
  final comentario = Comentario(texto: 'Que verga tan bacana', autor: andreushin, fecha: DateTime.now());
  fotoViral.agregarComentario(comentario);
  final respuestaComentario = Comentario(texto: 'Gracias parce!', autor: devGordon, fecha: DateTime.now());
  comentario.responder(respuestaComentario);
  print('Tu: "${comentario.texto}"');
  print('dev_gordon: "${respuestaComentario.texto}"');

  _capitulo('ajustas tu privacidad');
  print('Tu perfil era privado: ${andreushin.privado}');
  andreushin.privado = true;
  print('Ahora tu perfil es privado: ${andreushin.privado}');

  _capitulo('haces limpieza');
  chat.silenciar();
  respuesta.eliminar();
  comentario.eliminar();
  tuFoto.eliminar();
  print('Silenciaste el chat, borraste un mensaje, un comentario y tu foto.');
  print('Tu foto quedo eliminada: ${tuFoto.eliminado} (comentarios restantes: ${tuFoto.comentarios.length})');

  _capitulo('revisas tus notificaciones');
  print('Tienes ${andreushin.notificaciones.length} notificaciones:');
  for (final n in andreushin.notificaciones) {
    print('  - ${n.tipo} (leida: ${n.leida})');
  }
  andreushin.notificaciones.first.marcarLeida();
  print('Marcaste la primera como leida.');

  _capitulo('identidad de usuario');
  print('$andreushin (toString)');
  print('andreushin == dev_gordon? ${andreushin == devGordon}');
  print('andreushin == andreushin? ${andreushin == andreushin}');
}
