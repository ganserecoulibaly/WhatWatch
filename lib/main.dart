import 'package:flutter/material.dart';
import 'recentfilm.dart';
import 'Film.dart';
import 'upcoming.dart';
import 'popular.dart';
import 'Favorite.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      title: 'Films',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FilmsPage(),
    );
  }
}

class FilmsPage extends StatefulWidget {
  //static List<String> favoriteFilms = [];
  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  final List<Film> favoriteFilms = [];
  //final List<Film> favoriteFilms = [];

  @override
  void initState() {
    super.initState();
    //_getFilms();
  }

  


_toggleFavorite(List<Film> favoriteFilms,Film film) {
    setState(() {
      if (favoriteFilms.contains(film)) {
        favoriteFilms.remove(film);
        film.isFavorite = false;
      } else {
        favoriteFilms.add(film);
        film.isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Films'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'À venir'),
              Tab(text: 'Récent'),
              Tab(text: 'Populaire'),
              Tab(text: 'Favoris'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UpcomingUPage(),
            FilmsRPage(),
            PopularPPage(),
            FavoritePage()//RecentFilmsList(_films, _favoriteFilms, _toggleFavorite),
          ],
        ),
       ),
    );
  }
}

