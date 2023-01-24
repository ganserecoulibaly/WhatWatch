import 'package:flutter/material.dart';
import 'dart:convert';

class Film {
//  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate; 
  bool isFavorite;

  Film({
  //  required this.id
      required this.title
    , required  this.overview
    ,required this.posterPath
    ,required this.releaseDate
  , this.isFavorite=false 
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
   //   id: json['id'],
      title: json['title'],
      overview: json['overview'],   
      posterPath: json['poster_path'],   
      releaseDate: json['release_date'],        
    );
  }


}