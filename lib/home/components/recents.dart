import 'package:flutter/material.dart';
import 'package:whatwatch/home/home.dart';


class Recents extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recents'),
      ),
      body: Center(
        child: Text('page films récents')
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
}