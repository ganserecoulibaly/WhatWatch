import 'package:flutter/material.dart';
import 'Film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globals.dart' as globals;


class UpcomingUPage extends StatefulWidget {
    const UpcomingUPage({Key? key}) : super(key: key);
    
  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingUPage> {
 @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
 return Scaffold(
        appBar: AppBar(
          title: const Text('Recent'),
        ),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Film>>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Film> users = snapshot.data as List<Film>;
              return GridView.builder(
                    gridDelegate: 
                          SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: (itemWidth / itemHeight),
                          ),
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
                                  image: new NetworkImage('https://image.tmdb.org/t/p/w500/'+users[index].posterPath),
                                )
                              ),
                            ),
                            Text(users[index].overview), 
                            IconButton(
                            icon: globals.favMovies.contains(users[index].title)
                            ? Icon(
                              Icons.favorite,
                              color : Colors.red)
                            : Icon(
                              Icons.favorite_border
                              ),
                        onPressed: () {
                          setState(() {                            
                            users[index].isFavorite = true;                        
                            if (globals.favMovies.contains(users[index].title)) {
                                globals.favMovies.remove(users[index].title);
                            } else {
                                globals.favMovies.add(users[index].title);
                            }
                            print(globals.favMovies);          
                          });
                        },)                          
                            ],
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Text('errorrrr');
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }


    Future<List<Film>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=aee625b964853feedc62a5fa19de554f&language=fr-FR&page=1'));

 return (json.decode(response.body)['results'] as List)
      .map((e) => Film.fromJson(e))
      .toList();
}

}