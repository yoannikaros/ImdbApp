class Movie {
  final String id;
  final String reviewApiPath;
  final String imdb;
  final String contentType;
  final String title;
  final String image;
  final String plot;

  final List<String> genre;
  final List<String> actors;

  Movie({
    required this.id,
    required this.reviewApiPath,
    required this.imdb,
    required this.contentType,
    required this.title,
    required this.image,
    required this.plot,
    required this.genre,
    required this.actors,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      reviewApiPath: json['review_api_path'],
      imdb: json['imdb'],
      contentType: json['contentType'],
      title: json['title'],
      image: json['image'],
      plot: json['plot'],
      genre: List<String>.from(json['genre'].map((genre) => genre)),
      actors: List<String>.from(json['actors'].map((actors) => actors)),
    );
  }
}

class Rating {
  final int count;
  final double star;

  Rating({required this.count, required this.star});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      count: json['count'],
      star: json['star'],
    );
  }
}
