import 'package:flutter/material.dart';
import 'categories.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //it enable scroll on small device 
    return SingleChildScrollView(
      child: Column(
        children: const [
          CategoryList()
         // Genres(),
        //  MovieCarousel(),
        ],
      ),
    );
  }
}