import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';

import 'genre_model.dart';

class TvDetailResponse extends Equatable {
  TvDetailResponse({
    required this.backdropPath,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.status,
    required this.tagline,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });
  final String? backdropPath;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String status;
  final String tagline;
  final String name;
  final double voteAverage;
  final int voteCount;

  factory TvDetailResponse.fromJson(Map<String, dynamic> json) =>
      TvDetailResponse(
          backdropPath: json["backdrop_path"],
          genres: List<GenreModel>.from(
              json["genres"].map((x) => GenreModel.fromJson(x))),
          homepage: json["homepage"],
          id: json["id"],
          originalLanguage: json["original_language"],
          originalName: json["original_name"],
          overview: json["overview"],
          popularity: json["popularity"].toDouble(),
          posterPath: json["poster_path"] ?? '',
          status: json["status"],
          tagline: json["tagline"],
          name: json["name"],
          voteAverage: json["vote_average"].toDouble(),
          voteCount: json["vote_count"]);

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "status": status,
        "tagline": tagline,
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
  TvDetail toEntity() {
    return TvDetail(
      backdropPath: this.backdropPath, 
      genres: this.genres.map((genre) => genre.toEntity()).toList(), 
      id: this.id, 
      originalName: this.originalName, 
      overview: this.overview, 
      posterPath: this.posterPath, 
      name: this.name, 
      voteAverage: this.voteAverage, 
      voteCount: this.voteCount
    );  
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        genres,
        homepage,
        id,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        status,
        tagline,
        name,
        voteAverage,
        voteCount,
      ];
}
