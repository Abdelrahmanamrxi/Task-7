import 'dart:io';

import 'package:flutter/material.dart';

class Options extends StatelessWidget {

  final String title;
  final IconData icon;
  Colors ? color;

  File ? selectedImage;
  final VoidCallback onPressed;



  Options({  this.selectedImage, this.color,required this.onPressed, required this.icon ,required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: selectedImage == null ? Colors.grey : Colors.red,
          icon: Icon(icon),
          onPressed: onPressed,

        ),
        Text((title)),
      ],
    );
  }
}