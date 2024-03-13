class moveModel {
  String title;
  String overview;
  String backdropPath;
  String posterPath;

  moveModel({
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
  });

  factory moveModel.fromJson(Map<String, dynamic> json) {
    return moveModel(
      title: json['title'],
      overview: json['overview'],
      backdropPath: "https://image.tmdb.org/t/p/w500${json['backdrop_path']}",
      posterPath: "https://image.tmdb.org/t/p/w500${json['poster_path']}",
    );
  }
}
