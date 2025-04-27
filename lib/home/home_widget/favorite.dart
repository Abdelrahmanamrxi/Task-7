import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  bool click=false;
  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: () {
      setState(() {
        click=!click;
      });
    }, icon: Icon(Icons.favorite,color:click? Colors.red : Colors.black));
  }
}

