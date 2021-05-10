import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final allCategory = Category(
  categoryId: 0,
  name: "All",
  icon: Icons.search,
);

final musicCategory = Category(
  categoryId: 1,
  name: "Musical",
  icon: Icons.music_note,
);

final technicalCategory = Category(
  categoryId: 2,
  name: "Technical",
  icon: Icons.computer_rounded,
);

final literatureCategory = Category(
  categoryId: 3,
  name: "Literature",
  icon: Icons.book,
);

final newsCategory = Category(
  categoryId: 4,
  name: "News",
  icon: Icons.emoji_emotions,
);

final categories = [
  //have to add other categories
  allCategory,
  musicCategory,
  technicalCategory,
  literatureCategory,
  newsCategory,
];
