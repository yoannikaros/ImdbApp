class Movie {
  final String id;
  final String title;
  final int year;
  final String type;
  final String image;
  final String imageLarge;
  final String apiPath;
  final String imdb;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.type,
    required this.image,
    required this.imageLarge,
    required this.apiPath,
    required this.imdb,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      type: json['type'],
      image: json['image'],
      imageLarge: json['image_large'],
      apiPath: json['api_path'],
      imdb: json['imdb'],
    );
  }
}
