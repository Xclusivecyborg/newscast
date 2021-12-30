class Articles {
  final String? author;
  final String? title;
  final String? url;
  final String? content;
  final DateTime? publishedAt;
  final String? source;
  final String? image;

  Articles(
      {this.image,
      this.source,
      this.author,
      this.title,
      this.url,
      this.content,
      this.publishedAt});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      author: json["author"] ?? '',
      content: json["content"] ?? '',
      publishedAt: DateTime.parse(json["publishedAt"]),
      source: json["source"]["name"] ?? '',
      title: json["title"] ?? '',
      url: json["url"] ?? '',
      image: json["urlToImage"] ?? '',
    );
  }

  @override
  String toString() {
    return 'author: $author,title: $title,url: $url,image: $image,content: $content,publishedAt: $publishedAt,source: $source';
  }
}
