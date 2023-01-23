import 'package:flutter/material.dart';

class Film {
  final String title; 
  bool isFavorite;

  Film({required this.title, this.isFavorite = false});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],      
    );
  }

  static List<Film> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((filmJson) => Film.fromJson(filmJson)).toList();
  }
}