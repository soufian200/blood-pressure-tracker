import 'package:flutter/material.dart';

class PostModel {
  PostModel(
      {required this.title, required this.content, this.color = Colors.blue});
  String title;
  List<Widget> content;
  Color color;
}
