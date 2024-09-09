import '../../../data/repositories/movie_repositorie.dart';
import 'get_movie_param.dart';
import '../usecase.dart';

import '../../movie.dart';
import '../../result.dart';

class GetMovieList implements Usecase<Result<List<Movie>>, GetMovieListParam> {
  final MovieRepositorie _movieRepositorie;

  GetMovieList({required MovieRepositorie movieRepositorie})
      : _movieRepositorie = movieRepositorie;

  @override
  Future<Result<List<Movie>>> call(GetMovieListParam params) async {
    var response = switch (params.movieCategory) {
      MovieCategory.nowPlaying =>
        await _movieRepositorie.getNowPlaying(page: params.page),
      MovieCategory.upcoming =>
        await _movieRepositorie.getUpComing(page: params.page),
    };
    return switch (response) {
      Success(value: final movies) => Result.success(movies),
      Failed(:final message) => Result.failed(message)
    };
  }
}
