import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatwatch/home/components/listeFilms.dart';
import 'package:whatwatch/home/home.dart';
import 'package:whatwatch/home/model/movieModel.dart';
import 'package:http/http.dart' as http;

class Bestnotes extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('meilleures notes'),
      ),
         body: Padding(
        child: FutureBuilder<List<movieModel>>(
          future: fetchHomeData(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? listFilms(movieList: snapshot.data as List<movieModel>)
                : Center(child: CircularProgressIndicator());
          },
        ),
        padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
      ),
            bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite), 
              onPressed: () {Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => new HomeScreen()              
              ));}
            ),
            // ignore: prefer_const_constructors
            Spacer(),
            IconButton(
              icon: const Icon(Icons.home), 
              onPressed: () {Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => new HomeScreen()
              
              ));} 
            )
         ] 
        ), 
        )
    );
  }

  ///appel de la liste de films les mieux notés
static Future<List<movieModel>> fetchHomeData(http.Client client) async {

  final response =
      await client.get(Uri.parse('https://api.themoviedb.org/3/discover/movie/?&sort_by=vote_average.desc&api_key=aee625b964853feedc62a5fa19de554f&language=fr-FR&page=1'));
      
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseMovies, response.body);
  }

  static List<movieModel> parseMovies(String responseBody) {
    final parsed = json.decode(responseBody)['results'].cast<Map<String, dynamic>>();
    return parsed.map<movieModel>((json) => movieModel.fromJson(json)).toList();
  }
}