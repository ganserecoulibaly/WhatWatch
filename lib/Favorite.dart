import 'package:flutter/material.dart';
import 'Film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globals.dart' as globals;



class FavoritePage extends StatefulWidget {
    //final List<Film> favoriteFilms;
    const FavoritePage({Key? key}) : super(key: key);
    
  @override
  _FavoritePage createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> {


    @override
  void initState() {
    super.initState();
  }


@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favoris',
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Favoris'),
          
        ),
        body: ListView.builder(
          itemCount: globals.favMovies.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(globals.favMovies[index]),
            );
          },
        ),
      ),
    );
  }
}

