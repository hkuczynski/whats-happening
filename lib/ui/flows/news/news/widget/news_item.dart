import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:whats_happening/ui/constants.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    this.onPressed,
  }) : assert(title != null);

  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _NewsItemContent(imageUrl: imageUrl),
              _NewsItemFooter(title: title),
            ],
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}

class _NewsItemFooter extends StatelessWidget {
  const _NewsItemFooter({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.margin),
      child: Text(title, maxLines: 1),
    );
  }
}

class _NewsItemContent extends StatelessWidget {
  const _NewsItemContent({@required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.1),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
