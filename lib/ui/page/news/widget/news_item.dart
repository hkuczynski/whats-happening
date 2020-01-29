import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
  })  : assert(title != null),
        assert(description != null),
        assert(imageUrl != null);

  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.1),
      child: Text(title),
    );
  }
}
