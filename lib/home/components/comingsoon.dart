import 'package:flutter/material.dart';
import 'package:whatwatch/home/home.dart';


class comingsoon extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('comingsoon'),
      ),
      body: Center(
        child: Text('page films à venir')
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