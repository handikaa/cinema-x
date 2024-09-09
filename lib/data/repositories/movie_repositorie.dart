import '../../domain/actor.dart';
import '../../domain/movie.dart';
import '../../domain/result.dart';

import '../../domain/movie_detail.dart';

abstract interface class MovieRepositorie {
  Future<Result<List<Movie>>> getNowPlaying({int page = 1});
  Future<Result<List<Movie>>> getUpComing({int page = 1});
  Future<Result<MovieDetail>> getMovieDetail({required int id});
  Future<Result<List<Actor>>> getActors({required int id});
}
