// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatwatch/home/components/body_home.dart';


class HomeScreen extends StatelessWidget {
      const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context,"What Watch"),
      body: Body(),
      //Bottom navigation
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
        ),
    );
  }
}



//return App Bar for Home Page
AppBar buildAppBar(context, String title) {
  return AppBar(
    title: Text(title),
  );
}
