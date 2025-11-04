import 'album.dart';
import 'package:flutter/material.dart';

enum Genre {
  pop,
  latin,
  rock,
  classic,
  hiphop,
  rap,
  metal,
  jazz,
  blues,
  reageton,
  undefined,
}

Map<Genre, String> genres = {
  Genre.pop: "Pop",
  Genre.latin: "Música latina",
  Genre.rock: "Rock",
  Genre.classic: "Música clásica",
  Genre.hiphop: "Hip hop",
  Genre.rap: "Rap",
  Genre.metal: "Rock-Metal",
  Genre.jazz: "Jazz",
  Genre.blues: "Blues",
  Genre.reageton: "Reageton",
  Genre.undefined: "No definido",
};

class AlbumBiblio extends ChangeNotifier {
  final List<Album> _listaAlbumes = [];
  AlbumBiblio();
  List<Album> get albumes => _listaAlbumes;
  void addAlbum(Album album) {
    _listaAlbumes.add(album);
    notifyListeners();
  }

  bool updateAlbum(int index, Album album) {
    if (index >= 0 && index < _listaAlbumes.length) {
      _listaAlbumes[index] = album;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool removeAlbum(int index) {
    if (index >= 0 && index < _listaAlbumes.length) {
      _listaAlbumes.removeAt(index);
      notifyListeners();
      return true;
    }
    return false;
  }

  Album getAlbumByIndex(int index) {
    return _listaAlbumes[index];
  }
}
