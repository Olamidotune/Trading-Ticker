class News {
  News({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  factory News.fromJson(Map<String, dynamic> json) {
    return News(

        author: json ['articles'] [0]['author'],
        title: json['articles'] [0]['title'],
        description: json['articles'] [0]['description'],
        url: json['articles'] [0]['url'],
        urlToImage: json['articles'] [0]['urlToImage'],
        publishedAt: json['articles'] [0]['publishedAt'],);
  }
}

// List newsList = [];
