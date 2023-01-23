import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'recentfilm.dart';
import 'upcomingfilm.dart';
import 'Film.dart';
import 'favoritefilm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Films',
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
  List<Film> _films = [];
  List<Film> _favoriteFilms = [];

  @override
  void initState() {
    super.initState();
    _getFilms();
  }

  _getFilms() async {
    final response = await http.get(Uri.parse('https://api.example.com/films'));
    if (response.statusCode == 200) {
      setState(() {
        _films = Film.fromJsonList(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load films');
    }
  }

  _toggleFavorite(Film film) {
    setState(() {
      if (_favoriteFilms.contains(film)) {
        _favoriteFilms.remove(film);
        film.isFavorite = false;
      } else {
        _favoriteFilms.add(film);
        film.isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Films'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'À venir'),
              Tab(text: 'Récents'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UpcomingFilmsList(_films, _favoriteFilms, _toggleFavorite),
            RecentFilmsList(_films, _favoriteFilms, _toggleFavorite),
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
              FavoriteFilmsList(_favoriteFilms, _toggleFavorite),
            ],
          ),
        ),
      ),
    );
  }
}

