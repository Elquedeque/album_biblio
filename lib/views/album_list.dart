import 'package:album_biblio/views/eliminacion.dart';
import 'package:flutter/material.dart';
import '../model/albumbiblio.dart';
import 'album_vista.dart';
import 'perfil_usuario.dart';
import 'acerca_de.dart';

class AlbumLista extends StatefulWidget {
  const AlbumLista({super.key});

  @override
  State<AlbumLista> createState() => _AlbumListaState();
}

class _AlbumListaState extends State<AlbumLista> {
  int albumSeleccionado = 0;
  late AlbumBiblio albumes;

  void mostrarAlbum(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AlbumVista(album: albumes.getAlbumByIndex(index)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    albumes = AlbumBiblio();
    albumes.addAlbum(
      Album(
        titulo: "The Dark Side of the Moon",
        artista: "Pink Floyd",
        anio: 1973,
        genre: Genre.rock,
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Pet Sounds",
        artista: "The Beach Boys",
        anio: 1966,
        genre: Genre.rock,
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "OK Computer",
        artista: "Radiohead",
        anio: 1997,
        genre: Genre.rock,
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Who's next",
        artista: "The Who",
        anio: 1971,
        genre: Genre.rock,
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Nevermind",
        artista: "Nirvana",
        anio: 1991,
        genre: Genre.rock,
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Off the Wall",
        artista: "Michael Jackson",
        anio: 1979,
        genre: Genre.pop,
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Blonde on Blonde",
        artista: "Bob Dylan",
        anio: 1966,
        genre: Genre.rock,
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Born to Run",
        artista: "Bruce Springsteen",
        anio: 1975,
        genre: Genre.rock,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Biblioteca de Álbumes"),
        // Implementación del menú de acciones (Código 7-26)
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry>[
              const PopupMenuItem(value: 1, child: Text("Perfíl del usuario")),
              const PopupMenuItem(value: 2, child: Text("Acerca de ...")),
            ],
            onSelected: (value) {
              setState(() {
                if (value == 1) {
                  // Navegación al Perfil (Código 7-26)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PerfilUsuario(),
                    ),
                  );
                } else if (value == 2) {
                  // Navegación a AcercaDe (Actividad Complementaria 4a)
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AcercaDe()),
                  );
                }
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: ListTile.divideTiles(
          context: context,
          tiles: crearLista(),
          // Se mantiene el color original de su código:
          color: const Color.fromARGB(255, 31, 32, 34),
        ).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Nuevo album',
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> crearLista() {
    final List<Widget> lista = <Widget>[];
    for (int i = 0; i < albumes.albumes.length; i++) {
      Album album = albumes.albumes[i];
      lista.add(
        ListTile(
          leading: const Icon(Icons.album),
          title: Text(album.titulo),
          subtitle: Text(
            // Se utiliza el getter .genero
            "${album.artista}, Año: ${album.anio}, Género: ${album.genero}",
          ),
          trailing: SizedBox(
            width: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: crearButtonsBar(i),
            ),
          ),
          // Se mantienen sus estilos originales:
          textColor: const Color.fromARGB(255, 48, 47, 47),
          tileColor: const Color.fromARGB(255, 172, 245, 200),
          selectedColor: const Color.fromARGB(255, 253, 249, 249),
          selectedTileColor: const Color.fromARGB(255, 35, 70, 24),
          selected:
              (albumSeleccionado == i), // Se mantiene su variable original
          onTap: () => albumTapped(i),
        ),
      );
    }
    return lista;
  }

  void albumTapped(int i) {
    setState(() {
      albumSeleccionado = i;
    });
  }

  Widget crearButtonsBar(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          tooltip: "Ver",
          onPressed: () {
            // Se implementa la navegación al AlbumVista (Código 7-24)
            mostrarAlbum(context, index);
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          tooltip: "Editar",
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          tooltip: "Eliminar",
          onPressed: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Eliminacion(albumes: albumes, index: index),
                  ),
                )
                .then((_) {
                  // Actualiza la lista al regresar
                  setState(() {});
                });
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
