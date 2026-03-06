class MovieModel {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final double rating;
  final String releaseDate;
  final String overview;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate,
    required this.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    String pPath = json['poster_path'] ?? "";
    String bPath = json['backdrop_path'] ?? "";
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      posterPath: pPath.startsWith('http') ? pPath : "https://image.tmdb.org/t/p/w500$pPath",
      backdropPath: bPath.startsWith('http') ? bPath : "https://image.tmdb.org/t/p/original$bPath",
      rating: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      overview: json['overview'] ?? '',
    );
  }
}
