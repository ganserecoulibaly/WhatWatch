import 'package:flutter/material.dart';
import 'Film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PopularPPage extends StatefulWidget {
 
    const PopularPPage({Key? key}) : super(key: key);
     
    
  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPPage> {
  
   //List<Film> _favoriteFilms = [];

  @override
  Widget build(BuildContext context) {
 return Scaffold(
        appBar: AppBar(
          title: const Text('Popular'),
        ),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Film>>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Film> users = snapshot.data as List<Film>;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(users[index].title,style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(users[index].releaseDate,style: TextStyle(fontWeight: FontWeight.bold)),
                                  new Container(
                              decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  alignment: FractionalOffset.topCenter,
                                  image: new NetworkImage('https://image.tmdb.org/t/p/w500/kO35BwoKHyP1VRulxZJVeEl5dvS.jpg'),
                                )
                              ),
                            ),
                            Text(users[index].overview)                            
                            ],
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Text('error');
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }


    Future<List<Film>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=aee625b964853feedc62a5fa19de554f&language=fr-FR&page=1'));

 return (json.decode(response.body)['results'] as List)
      .map((e) => Film.fromJson(e))
      .toList();
}

/* _toggleFavorite(Film film) {
    setState(() {
      if (_favoriteFilms.contains(film)) {
        _favoriteFilms.remove(film);
      } else {
        _favoriteFilms.add(film);
      }
    });
  }
*/
}