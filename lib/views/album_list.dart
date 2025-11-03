import 'package:flutter/material.dart';
import '../model/albumbiblio.dart';

class AlbumLista extends StatefulWidget {
  const AlbumLista({super.key});

  @override
  State<AlbumLista> createState() => _AlbumListaState();
}

class _AlbumListaState extends State<AlbumLista> {
  int albumSeleccionado = 0;
  late AlbumBiblio albumes;

  @override
  void initState() {
    super.initState();
    albumes = AlbumBiblio();
    albumes.addAlbum(
      Album(
        titulo: "The Dark Side of the Moon",
        artista: "Pink Floyd",
        anio: 1973,
        genre: "Rock",
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Pet Sounds",
        artista: "The Beach Boys",
        anio: 1966,
        genre: "Rock",
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "OK Computer",
        artista: "Radiohead",
        anio: 1997,
        genre: "Rock",
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Who's next",
        artista: "The Who",
        anio: 1971,
        genre: "Rock",
      ),
    );
    albumes.addAlbum(
      Album(titulo: "Nevermind", artista: "Nirvana", anio: 1991, genre: "Rock"),
    );
    albumes.addAlbum(
      Album(
        titulo: "Off the Wall",
        artista: "Michael Jackson",
        anio: 1979,
        genre: "Pop",
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Blonde on Blonde",
        artista: "Bob Dylan",
        anio: 1966,
        genre: "Blues Rock",
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Born to Run",
        artista: "Bruce Springsteen",
        anio: 1975,
        genre: "Blues Rock",
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
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: ListTile.divideTiles(
          context: context,
          tiles: crearLista(),
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
            "${album.artista}, Año: ${album.anio}, Género: ${album.genre}",
          ),
          trailing: SizedBox(
            width: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: crearButtonsBar(i),
            ),
          ),
          textColor: const Color.fromARGB(255, 48, 47, 47),
          tileColor: const Color.fromARGB(255, 172, 245, 200),
          selectedColor: const Color.fromARGB(255, 253, 249, 249),
          selectedTileColor: const Color.fromARGB(255, 35, 70, 24),
          selected: (albumSeleccionado == i),
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
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          tooltip: "Editar",
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          tooltip: "Eliminar",
          onPressed: () {},
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
