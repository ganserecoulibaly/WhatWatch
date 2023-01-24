import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'recentfilm.dart';
import 'Film.dart';
import 'upcoming.dart';
import 'popular.dart';


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
  
  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  final List<Film> _films = [];
  final List<Film> favoriteFilms = [];

  @override
  void initState() {
    super.initState();
    //_getFilms();
  }

  


 /* _toggleFavorite(Film film) {
    setState(() {
      if (_favoriteFilms.contains(film)) {
        _favoriteFilms.remove(film);
        film.isFavorite = false;
      } else {
        _favoriteFilms.add(film);
        film.isFavorite = true;
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Films'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'À venir'),
              Tab(text: 'Récent'),
              Tab(text: 'Populaire'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UpcomingUPage(),
            FilmsRPage(),
            PopularPPage(),//RecentFilmsList(_films, _favoriteFilms, _toggleFavorite),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Favoris'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              //FavoriteFilmsList(_favoriteFilms, _toggleFavorite),
            ],
          ),
        ),
      ),
    );
  }
}

