

import 'package:flutter/material.dart';

class MyPet extends StatelessWidget {

  const MyPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          height: 100,

          width: 100,
          fit: BoxFit.cover,
          "assets/mm.jpg",
        ),

        Text("TTT", style: TextStyle(color: Colors.white, fontSize: 30)),
      ],
    );
  }
}