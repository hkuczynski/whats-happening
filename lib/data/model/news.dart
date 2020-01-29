class News {
  const News({
    this.author,
    this.title,
    this.description,
    this.url,
    this.imageUrl,
    this.publishedAt,
    this.content,
  });

  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final DateTime publishedAt;
  final String content;
}
