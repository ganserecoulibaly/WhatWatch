import 'package:flutter/material.dart';
import 'Film.dart';


class FavoriteFilmsList extends StatelessWidget {
  final List<Film> films;

  FavoriteFilmsList(this.films, Function(Film film) toggleFavorite);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        final film = films[index];
        return ListTile(
          title: Text(film.title),
          //subtitle: Text(film.releaseDate),
          trailing: IconButton(
            icon: film.isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () {
              setState(() {
                film.isFavorite = !film.isFavorite;
              });
            },
          ),
        );
      },
    );
  }
}