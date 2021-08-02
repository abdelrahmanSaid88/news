import 'package:flutter/cupertino.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color color;
  bool rightSided;

  Category({required this.id, required this.title, required this.imagePath, required this.color, required this.rightSided});
}
