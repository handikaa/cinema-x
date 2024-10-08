import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required int id,
    required String title,
    required String overview,
    String? posterPath,
    String? backdropPath,
    required int runTime,
    required double voteAverage,
    required List<String> genres,
  }) = _MovieDetail;

  factory MovieDetail.fromJSON(Map<String, dynamic> json) => MovieDetail(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        runTime: json['runtime'],
        voteAverage: (json['vote_average'] ?? 0).toDouble(),
        genres: List<String>.from(
          json['genres'].map((e) => e['name'] as String),
        ),
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
      );
}
