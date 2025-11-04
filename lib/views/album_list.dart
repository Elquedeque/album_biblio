import 'package:flutter/material.dart';
import '../model/albumbiblio.dart';
import '../model/album.dart';
import 'album_vista.dart';
import 'perfil_usuario.dart';
import 'album_form.dart';
import 'package:provider/provider.dart';
import 'acerca_de.dart';

class AlbumLista extends StatefulWidget {
  const AlbumLista({super.key});

  @override
  State<AlbumLista> createState() => _AlbumListaState();
}

class _AlbumListaState extends State<AlbumLista> {
  int albumSeleccionado = 0;
  late AlbumBiblio albumes;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    albumes = Provider.of<AlbumBiblio>(context);
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

      body: (albumes.albumes.isNotEmpty)
          ? ListView(
              padding: const EdgeInsets.all(10),
              children: ListTile.divideTiles(
                context: context,
                tiles: crearLista(),
                color: const Color.fromARGB(255, 31, 32, 34),
              ).toList(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    capturarAlbum(context);
                  },
                  child: const Text("Agregar Album"),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          capturarAlbum(context);
        },
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
            "${album.artista}, Año: ${album.anio}, Género: ${album.generos}",
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
          onPressed: () {
            actualizarAlbum(context, index);
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          tooltip: "Eliminar",
          onPressed: () {
            removerAlbum(index);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  Future<void> capturarAlbum(BuildContext context) async {
    final Album? album = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AlbumForm()),
    );
    if (album != null) {
      albumes.addAlbum(album);
    }
  }

  void mostrarAlbum(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AlbumVista(album: albumes.getAlbumByIndex(index)),
      ),
    );
  }

  Future<void> actualizarAlbum(BuildContext context, int index) async {
    Album? album = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumForm(album: albumes.getAlbumByIndex(index)),
      ),
    );
    if (album != null) {
      albumes.updateAlbum(index, album);
    }
  }

  bool removerAlbum(int index) {
    return albumes.removeAlbum(index);
  }
}
