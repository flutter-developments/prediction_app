import 'package:flutter/material.dart';

class Sports {
  String title;
  String image;
  String games;
  final VoidCallback onPressed;

  Sports({
    required this.title,
    required this.image,
    required this.games,
    required this.onPressed,
  });
}
