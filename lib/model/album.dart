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

Map genres = {
  Genre.pop: "Pop",
  Genre.blues: "Blues",
  Genre.classic: "Música clásica",
  Genre.hiphop: "Hip hop",
  Genre.jazz: "Jazz",
  Genre.latin: "Música latina",
  Genre.metal: "Rock-Metal",
  Genre.rap: "Rap",
  Genre.reageton: "Reageton",
  Genre.rock: "Rock",
  Genre.undefined: "No definido",
};

class Album {
  late String? _id;
  late String _titulo;
  late String _artista;
  late int _anio;
  late Genre _genre;

  Album(this._titulo, this._artista, this._anio, this._genre);

  Album.vacio() {
    _titulo = "";
    _artista = "";
    _anio = 0;
    _genre = Genre.undefined;
  }

  String get titulo => _titulo;
  String get artista => _artista;
  int get anio => _anio;
  Genre get genre => _genre;
  String get generos => genres[_genre];

  set titulo(String titulo) => _titulo;
  set artista(String artista) => _artista;
  set anio(int anio) => _anio;
  set genre(Genre genero) => _genre;

  Album.fromJson(Map<String, dynamic> json)
    : _titulo = json['titulo'],
      _artista = json['artista'],
      _anio = json['anio'],
      _genre = Genre.values.byName(json['genre']);

  Map<String, dynamic> toJson() => {
    'titulo': _titulo,
    'artista': _artista,
    'anio': _anio,
    'gender': _genre.name,
  };

  @override
  String toString() {
    return "Album{id: $_id, titulo: $_titulo, artista, $_artista, anio: $_anio, genre:${_genre.name}}";
  }
}
