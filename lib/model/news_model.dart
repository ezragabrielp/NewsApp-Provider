class NewsModel {
  final String? author;
  final String? title;
  final String? description;
  final String? content;
  final String? image;
  final String? url;
  final String? publishedAt;

  NewsModel(
      {this.author,
      this.title,
      this.description,
      this.content,
      this.image,
      this.url,
      this.publishedAt});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        content: json["content"],
        image: json["urlToImage"],
        url: json["url"],
        publishedAt: json["publishedAt"]);
  }
}
