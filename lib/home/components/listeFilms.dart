import 'package:flutter/material.dart';
import 'package:whatwatch/home/model/movieModel.dart';

 
class listFilms extends StatelessWidget {

  final List<movieModel> movieList;
  final Set<movieModel> _saved = Set<movieModel>();

  listFilms({Key? key, required this.movieList}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    //final bool alreadySaved = _saved.contains(value);
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return Column(  
          children: <Widget>[
                  Container(
        child: Padding(
          padding:
              new EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               IconButton(
              icon: const Icon(Icons.favorite), 
              color:  Colors.red,
              onPressed: () {}
            ),
              Text(
                  movieList[index].title,                  
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
               Text(
                  movieList[index].plotSummary,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ), 
           /*  Image.network('https://image.tmdb.org/t/p/w500'+ movieList[index].posterpath,
                  width: 150.0,
                  height: 150.0,
                  alignment: Alignment.center,
                  fit: BoxFit.fill), */
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
            ],
          ),
        ),                      
                 )],
        );
      },
    );
  }
}